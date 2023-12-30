// ignore_for_file: unused_local_variable

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:background_fetch/background_fetch.dart';
import 'package:provider/provider.dart';
import 'package:time_guard/models/app_model.dart';
import 'package:time_guard/services/isar.dart';
import 'package:time_guard/services/notification.dart';
import 'package:time_guard/services/provider/app_provider.dart';
import 'package:time_guard/shared/utils/logger.dart';

class BackgroundService {
  /// Initialization code
  Future<void> initPlatformState(BuildContext context) async {
    final allApps = context.read<AppProvider>().allApps;
    final trackedApps = context.read<AppProvider>().trackedApps;
    int totalTimeUsedOnAllApps = 0;
    final isarDb = IsarDB();

    // Configure BackgroundFetch.
    int status = await BackgroundFetch.configure(
      BackgroundFetchConfig(
        minimumFetchInterval: 15,
        stopOnTerminate: false,
        enableHeadless: true,
        requiresBatteryNotLow: false,
        requiresCharging: false,
        requiresStorageNotLow: false,
        requiresDeviceIdle: false,
        requiredNetworkType: NetworkType.NONE
    ), 
    // onFetch
    (String taskId) async {
      // All apps
      // for (var singleApp in allApps) {
      //   totalTimeUsedOnAllApps += singleApp.timeUsedOnAppInSeconds;
      // }

      // Tracked Apps
      for (App app in trackedApps) {
        double timePercent = (app.timeUsedOnAppInSeconds / app.usageLimitInSeconds) * 100;
        logger(timePercent);

        if (app.timeUsedOnAppInSeconds >= app.usageLimitInSeconds) {
          Notifications.showNotification(
            title: '${app.appName} usage limit reached', 
            body: 'You have exceeded your usage limit of ${app.usageLimit} for ${app.appName} application. You can increase your usage limit in the app.'
          );
        } else if (timePercent >= 85.0) {
          Notifications.showNotification(
            title: 'App usage limit warning', 
            body: 'You are approaching your usage limit for ${app.appName}. You have spent ${app.timeUsedOnApp} and the limit set is ${app.usageLimit}'
          );
        }
      }

      BackgroundFetch.finish(taskId);
    }, 
    // onTimeout
    (String taskId) async {
      BackgroundFetch.finish(taskId);
    });    
  }
}