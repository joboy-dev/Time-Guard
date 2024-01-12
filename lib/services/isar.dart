// ignore_for_file: use_build_context_synchronously

import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:time_guard/models/app_model.dart';
import 'package:time_guard/models/records_model.dart';
import 'package:time_guard/services/notification.dart';
import 'package:time_guard/services/provider/app_provider.dart';
import 'package:time_guard/services/provider/record_provider.dart';
import 'package:time_guard/shared/utils/logger.dart';
import 'package:time_guard/services/usage_stats.dart';
import 'package:time_guard/shared/widgets/snackbar.dart';

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

    return allApps;
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

  ///Function to get app by time
  Future<App?> getAppByTime(int time) async {
    final isar = await db;

    final app = await isar.txn(() => isar.apps.where().filter().timeUsedOnAppInSecondsEqualTo(time).findFirst());

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


  // -------------------- RECORD SCHEMA --------------------------
  
  /// Function to add records to isar db
  Future addRecord(BuildContext context) async {
    final isar = await db;

    Map usageData = await loadUsageData();
    List usedAppsData = usageData['usedAppsData'];
    final currentDate = DateTime.now();
    int mostTime = 0;

    // Get all apps
    final allApps = await getAllApps(context);

    // Loop through the list of all apps to get the most time used on an app
    for (App app in allApps) {
      if (app.timeUsedOnAppInSeconds > mostTime) {
        mostTime = app.timeUsedOnAppInSeconds;
      }
    }
    logger(mostTime);

    // Get most used app by time used
    final mostUsedApp = await getAppByTime(mostTime);
    if (mostUsedApp != null) {
      logger(mostUsedApp.appName);
    }

    bool recordAvailable = await recordExists();

    if (recordAvailable) {
      showSnackbar(context, 'There is a record available for today');
    } else {  
      // Add record to database
      final record = Record(
        date: '${currentDate.day}.${currentDate.month}.${currentDate.year}', 
        noOfAppsUsed: usedAppsData.length, 
        mostUsedApp: mostUsedApp!.appName, 
        timeForMostUsedApp: mostUsedApp.timeUsedOnApp, 
        timeForMostUsedAppInSeconds: mostUsedApp.timeUsedOnAppInSeconds,
        overallScreenTime: usageData['overallScreenTimeInSeconds'],
        overallScreenTimeRefined: '${usageData['totalHours']}h ${usageData['totalMinutes']}m'
      );

      isar.writeTxnSync(() => isar.records.putSync(record));

      // Add to provider
      context.read<RecordProvider>().addRecord(record);
      showSnackbar(context, 'Record data saved for today');
    }
  }


  /// Function to get all records from database
  Future getRecords(BuildContext context) async {
    final isar = await db;

    final records = await isar.txn(() => isar.records.where(sort: Sort.desc).findAll());

    // logger(record);
    context.read<RecordProvider>().clear();

    for (Record record in records) {
      context.read<RecordProvider>().addRecord(record);
    }

    return records;
  }


  /// Function to delete a record fro isar db
  Future deleteRecord(BuildContext context, int id) async {
    final isar = await db;

    await isar.writeTxn(() => isar.records.where().filter().idEqualTo(id).deleteAll());

    await getRecords(context);
  }


  /// Function to check if a record exists in the database
  Future recordExists() async {
    final isar = await db;
    final currentDate = DateTime.now();

    final records = await isar.txn(() => isar.records.where().findAll());

    if (records.isEmpty) {
      return false;
    } else {
      for (Record record in records) {
        String date = record.date;
        List splitDate = date.split('.');
        logger(splitDate);

        if (currentDate.day == int.parse(splitDate[0]) && currentDate.month == int.parse(splitDate[1]) && currentDate.year == int.parse(splitDate[2])) {
          return true;
        } else {
          return false;
        }
      }
    }
  }


  Future addRecordIsarAlone() async {
    final isar = await db;

    Map usageData = await loadUsageData();
    List usedAppsData = usageData['usedAppsData'];
    final currentDate = DateTime.now();
    int mostTime = 0;

    // Get all apps
    final allApps = await isar.txn(() => isar.apps.where().findAll());

    // Loop through the list of all apps to get the most time used on an app
    for (App app in allApps) {
      if (app.timeUsedOnAppInSeconds > mostTime) {
        mostTime = app.timeUsedOnAppInSeconds;
      }
    }
    logger(mostTime);

    // Get most used app by time used
    final mostUsedApp = await getAppByTime(mostTime);
    if (mostUsedApp != null) {
      logger(mostUsedApp.appName);
    }

    bool recordAvailable = await recordExists();

    if (recordAvailable) {
      logger('Record available for today');
    } else {  
      // Add record to database
      final record = Record(
        date: '${currentDate.day}.${currentDate.month}.${currentDate.year}', 
        noOfAppsUsed: usedAppsData.length, 
        mostUsedApp: mostUsedApp!.appName, 
        timeForMostUsedApp: mostUsedApp.timeUsedOnApp, 
        timeForMostUsedAppInSeconds: mostUsedApp.timeUsedOnAppInSeconds,
        overallScreenTime: usageData['overallScreenTimeInSeconds'],
        overallScreenTimeRefined: '${usageData['totalHours']}h ${usageData['totalMinutes']}m'
      );

      isar.writeTxnSync(() => isar.records.putSync(record));

      await Notifications.showNotification(title: 'Record added', body: 'Screen time record for today added.');
    }
  }



 
  /// Function to reload data
  Future reloadData(BuildContext context) async {
    // Remove all apps and records from provider
    context.read<AppProvider>().clear();
    context.read<RecordProvider>().clear();

    await getAllApps(context);
    await getAllTrackedApps(context);
    await getAllUntrackedApps(context);
    await getRecords(context);
  }
}
