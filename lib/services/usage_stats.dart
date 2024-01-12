// ignore_for_file: use_build_context_synchronously

import 'package:time_guard/services/isar.dart';
import 'package:usage_stats/usage_stats.dart';

// enum FilterDays {h12, h24, d3, d7, d14, d30}

/// Days filter option
Map<String, int> filterDays = {
  // '12 Hours': 12,
  '24 Hours': 24,
  '3 Days': 24 * 3,
  '7 Days': 24 * 7,
  // '14 Days': 24 * 14,
  '30 Days': 24 * 30,
};

Future<Map<String, dynamic>> getUsageData(int hours) async {
    // Screen time
    int totalOnScreenTime = 0;
    int screenTimeHour = 0;
    int screenTimeMinutes = 0;
    int overallScreenTimeInSeconds = 0;

    DateTime endDate = DateTime.now();
    DateTime startDate = endDate.subtract(Duration(hours: hours));

    List<String> packageNames = [];
    List appData = [];

    appData.clear();

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
          // 'timeUsedOnAppInSeconds': timeSpentInForeground.round(),
          // 'timeUsedOnAppRefined': '${screenTimeHour}h ${screenTimeMinutes}m',
          'timeUsedOnAppInSeconds': (double.parse(appStat.totalTimeInForeground!)/1000).round(),
          'timeUsedOnAppRefined': '${(double.parse(appStat.totalTimeInForeground!)/1000/60).round() ~/ 60}h ${(double.parse(appStat.totalTimeInForeground!)/1000/60).round() % 60}m',
          'percentageTimeSpent': ((double.parse(appStat.totalTimeInForeground!) / 1000).round() / (totalOnScreenTime * 60)) * 100,
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

    // logger('Overall time: ${data["overallScreenTimeInSeconds"]}');
    // logger('UsageStats: ${data["appData"]}');

    return data;
}

loadUsageData({int hours=12}) async {
  Map<String, dynamic> usageData = {};
  List allAppsData = [];
  List usedAppsData = [];

  allAppsData.clear();
  usedAppsData.clear();

  usageData = await getUsageData(hours);

  if (usageData['totalHours'] >= hours) {
    usageData.clear();
    usageData = await getUsageData(hours);
    // logger(usageData);
  }

  // Add all apps data into a list
  for (Map appData in usageData['appData']) {
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
    'overallScreenTimeInSeconds': usageData['overallScreenTimeInSeconds'],
  };
}