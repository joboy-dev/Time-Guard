import 'package:flutter/material.dart';
import 'package:time_guard/services/isar.dart';
import 'package:usage_stats/usage_stats.dart';

// enum FilterDays {h12, h24, d3, d7, d14, d30}

Map<String, int> filterDays = {
  '12 Hours': 12,
  '24 Hours': 24,
  '3 Days': 24 * 3,
  '7 Days': 24 * 7,
  // '14 Days': 24 * 14,
  '30 Days': 24 * 30,
};

Future<Map<String, dynamic>> getUsageData(BuildContext context, int hours) async {
    // Screen time
    int totalOnScreenTime = 0;
    int screenTimeHour = 0;
    int screenTimeMinutes = 0;
    int overallScreenTimeInSeconds = 0;

    DateTime endDate = DateTime.now();
    DateTime startDate = endDate.subtract(Duration(hours: hours));

    List<String> packageNames = [];
    List appData = [];

    // grant usage permission - opens Usage Settings
    UsageStats.grantUsagePermission();

    List<UsageInfo> usageStats = await UsageStats.queryUsageStats(startDate, endDate);

    for (var appStat in usageStats) {
      totalOnScreenTime += (double.parse(appStat.totalTimeInForeground!)/1000/60).round();

      // Convert screen time to hours and minutes
      screenTimeHour = totalOnScreenTime ~/ 60;
      screenTimeMinutes = totalOnScreenTime % 60;
      overallScreenTimeInSeconds = totalOnScreenTime * 60;

      packageNames.add(appStat.packageName!);

      final app = await IsarDB().getAppByPackageName(appStat.packageName!);

      if (app != null) {  
        Map appDetail = {
          'packageName': appStat.packageName,
          'timeUsedOnAppInSeconds': (double.parse(appStat.totalTimeInForeground!)/1000).round(),
          'timeUsedOnAppRefined': '${(double.parse(appStat.totalTimeInForeground!)/1000/60).round() ~/ 60}h ${(double.parse(appStat.totalTimeInForeground!)/1000/60).round() % 60}m',
          'percentageTimeSpent': ((double.parse(appStat.totalTimeInForeground!)/1000) / overallScreenTimeInSeconds) * 100,
          'appName': app.appName,
          'appIcon': app.appIcon,
        };
        // Format app data
        appData.add(appDetail);
      }

    }

    // Format final data
    Map<String, dynamic> data = {
      'totalHours': screenTimeHour,
      'totalMinutes': screenTimeMinutes,
      'overallScreenTimeInSeconds': overallScreenTimeInSeconds,
      'packageNames': packageNames,
      'appData': appData,
    };

    // logger('UsageStats: $data');

    return data;
}

loadUsageData(BuildContext context, {int hours=12}) async {
  Map<String, dynamic> usageData = {};
  List allAppsData = [];
  List usedAppsData = [];

  allAppsData.clear();
  usedAppsData.clear();

  // Map<String, dynamic> data = await getUsageData(context);
  // usageData = data;

  usageData = await getUsageData(context, hours);

  // Add all apps data into a list
  for (var appData in usageData['appData']) {
    allAppsData.add(appData);

    if (appData['timeUsedOnAppInSeconds'] > 0) {
      usedAppsData.add(appData);
    }
  }

  return {
    'allAppsData': allAppsData,
    'usedAppsData': usedAppsData,
    'totalHours': usageData['totalHours'],
    'totalMinutes': usageData['totalMinutes'],
  };
}