// ignore_for_file: use_build_context_synchronously

import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:time_guard/models/app_model.dart';
import 'package:time_guard/models/records_model.dart';
import 'package:time_guard/services/provider/app_provider.dart';
import 'package:time_guard/services/provider/record_provider.dart';
import 'package:time_guard/shared/utils/logger.dart';
import 'package:time_guard/shared/utils/usage_stats.dart';

class IsarDB {
   late Future<Isar> db;

  IsarDB() {
    db = openDB();
  }

  // -------------------GENERIC FUNCTIONS----------------------

  /// add up DB at app start
  Future<Isar> openDB() async {
    // Check if there is an active DB instance
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      // open isar db
      await Isar.open(
        [AppSchema, RecordSchema],
        directory: dir.path,
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }


  // -------------------- APP SCHEMA --------------------------


  /// Function to clear all data from thisar db and provider
  Future clearDB(BuildContext context) async {
    final isar = await db;

    // clear isar db
    isar.writeTxn(() => isar.clear());

    // clear all data in provider
    context.read<AppProvider>().clear();
  }


  /// Function to add all installed apps to isar db and provider
  Future addInstalledApps(BuildContext context) async {
    final isar = await db;
    List<Application> installedApps = await DeviceApps.getInstalledApplications(includeAppIcons: true, includeSystemApps: true, onlyAppsWithLaunchIntent: true);

    for (Application app in installedApps) {
      App newApp = App(
        appName: app.appName, 
        packageName: app.packageName, 
        versionName: app.versionName!, 
        appIcon: app is ApplicationWithIcon ? app.icon.toString() : null,
        isTracked: false,
        timeUsedOnApp: '0h 0m',
        usageLimit: '0h 0m',
        timeUsedOnAppInSeconds: 0,
        usageLimitInSeconds: 0,
      );

      isar.writeTxnSync<int>(() => isar.apps.putSync(newApp));
      context.read<AppProvider>().addAllApps(newApp);
    }
  }


  /// Function to get all apps in isar db
  Future getAllApps(BuildContext context) async {
    final isar = await db;
    final allApps = await isar.txn(() => isar.apps.where().findAll());

    // logger(allApps);

    for (App app in allApps) {
      context.read<AppProvider>().addAllApps(app);
    }
  }

  /// Function to get and add tracked apps in provider
  Future getAllTrackedApps(BuildContext context) async {
    final isar = await db;
    final trackedApps = await isar.txn(() => isar.apps.where().filter().isTrackedEqualTo(true).findAll());

    // logger(trackedApps);

    for (App app in trackedApps) {
      context.read<AppProvider>().addTrackedApp(app);
    }
  }


  /// Function to get and add untracked apps in provider
  Future getAllUntrackedApps(BuildContext context) async {
    final isar = await db;
    final untrackedApps = await isar.txn(() => isar.apps.where().filter().isTrackedEqualTo(false).findAll());

    // logger(untrackedApps);

    for (App app in untrackedApps) {
      context.read<AppProvider>().addUntrackedApp(app);
    }
  }


  ///Function to get app by package name
  Future<App?> getAppByPackageName(String packageName) async {
    final isar = await db;

    final app = await isar.txn(() => isar.apps.where().filter().packageNameEqualTo(packageName).findFirst());

    if (app != null) {
      return app;
    } else {
      return null;
    }
  }


  /// Function to add an app to tracked apps
  Future trackApp(BuildContext context, int id) async {
    final isar = await db;

    // Get app by id
    final app = await isar.txn(() => isar.apps.where().filter().idEqualTo(id).findFirst());

    if (app != null) {
      logger(app.appName);
      await isar.writeTxn(() async {
        // Update tracked status for app
        app.isTracked = true;
        await isar.apps.put(app);
      });

      context.read<AppProvider>().addTrackedApp(app);
      context.read<AppProvider>().removeUntrackedApp(app);

      // Reload data
      await reloadData(context);
    } else {
      logger('App does not exist');
    }
  }


  /// Function to remove an app from tracked apps
  Future untrackApp(BuildContext context, int id) async {
    final isar = await db;

    // Get app by id
    final app = await isar.txn(() => isar.apps.where().filter().idEqualTo(id).findFirst());

    if (app != null) {
      logger(app.appName);
      await isar.writeTxn(() async {
        // Update tracked status for app
        app.isTracked = false;
        await isar.apps.put(app);
      });

      context.read<AppProvider>().addUntrackedApp(app);
      context.read<AppProvider>().removeTrackedApp(app);

      // Reload data
      await reloadData(context);

    } else {
      logger('App does not exist');
    }
  }


  /// Function to update the time used on an application
  Future updateTimeUsedOnApp(App app, String timeUsed, int timeUsedInSeconds) async {
    final isar = await db;

    await isar.writeTxn(() async {
      app.timeUsedOnApp = timeUsed;
      app.timeUsedOnAppInSeconds = timeUsedInSeconds;
      await isar.apps.put(app);
    });

  }


  /// Function to update the useage limit for an application
  Future updateUsageLimit(App app, String usageLimit, int usageLimitInSeconds) async {
    final isar = await db;

    await isar.writeTxn(() async {
      app.usageLimit = usageLimit;
      app.usageLimitInSeconds = usageLimitInSeconds;
      await isar.apps.put(app);
    });
  }


  /// Function to reload data
  Future reloadData(BuildContext context) async {
    // Remove all apps and records from provider
    context.read<AppProvider>().clear();
    context.read<RecordProvider>().clear();

    await getAllApps(context);
    await getAllTrackedApps(context);
    await getAllUntrackedApps(context);
  }


  // -------------------- RECORD SCHEMA --------------------------
  
  /// Function to add all installed apps to isar db and provider
  Future addRecord(BuildContext context) async {
    final isar = await db;

    Map usageData = await loadUsageData(context);
    List usedAppsData = usageData['usedAppsData'];
    final currentDate = DateTime.now();
    Record? record;

    if (currentDate.hour >= 0 && currentDate.hour <= 3) {
      record = Record(
        date: '${currentDate.day}.${currentDate.month}.${currentDate.year}', 
        noOfAppsUsed: usedAppsData.length, 
        mostUsedApp: 'mostUsedApp', 
        timeForMostUsedApp: 'timeForMostUsedApp', 
        timeForMostUsedAppInSeconds: 1,
      );
    }

    isar.writeTxnSync(() => isar.records.putSync(record!));
  }  

}
