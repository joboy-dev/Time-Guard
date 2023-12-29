import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_guard/services/isar.dart';
import 'package:time_guard/shared/utils/logger.dart';
import 'package:usage_stats/usage_stats.dart';

Future<Map<String, dynamic>> getUsageData(BuildContext context, {
    int hours=24,
  }) async {
    // Screen time
    int totalOnScreenTime = 0;
    int screenTimeHour = 0;
    int screenTimeMinutes = 0;
    int overallScreenTimeInSeconds = 0;

    DateTime endDate = DateTime.now();
    // DateTime startDate = DateTime(endDate.year-startDateYearsToRemove, endDate.month-startDateMonthsToRemove, endDate.day-startDateDaysToRemove, 0, 0, 0);
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