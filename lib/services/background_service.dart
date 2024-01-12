// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
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
        requiredNetworkType: NetworkType.NONE,
    ), 
    // onFetch
    (String taskId) async {
      logger(taskId);

      // Tracked Apps
      for (App app in trackedApps) {
        double timePercent = (app.timeUsedOnAppInSeconds / app.usageLimitInSeconds) * 100;
        logger(timePercent);

        if (app.timeUsedOnAppInSeconds >= app.usageLimitInSeconds) {
          Notifications.showNotification(
            title: '${app.appName} Usage Limit Reached', 
            body: 'You have exceeded your usage limit of ${app.usageLimit} for ${app.appName} application. You have used the app for ${app.timeUsedOnApp}'
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
