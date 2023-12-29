import 'dart:typed_data';

import 'package:time_guard/shared/utils/logger.dart';
import 'package:time_guard/shared/utils/usage_stats.dart';

/// Function to convert string data into a uint8list
Uint8List convertToUint8Listt(String stringListData) {
  // Remove brackets and split the string into a list of string representations of integers
  List<String> integerStrings = stringListData.substring(1, stringListData.length - 1).split(',');

  // Convert the list of string representations to a list of integers
  List<int> integers = integerStrings.map((s) => int.parse(s)).toList();

  // Create a Uint8List from the list of integers
  Uint8List uint8List = Uint8List.fromList(integers);

  return uint8List;
}

removeDuplicates(List list) {
  // Set<String> uniqueEntries = {};
  Set uniqueEntries = {};
  List uniqueList = [];

  for (var entry in list) {
    // Convert each map entry to a string for comparison
    // String entryString = entry.toString();

    // Check if the set already contains this entry
    if (!uniqueEntries.contains(entry)) {
      uniqueEntries.add(entry);
      uniqueList.add(entry);
    }
  }

  return Map.fromIterable(uniqueList,
      key: (entry) => entry['packageName'], value: (entry) => entry);

  // logger('Duplicates Removal $uniqueList');

  // Map<String, dynamic> data = await getUsageData(context);

  // List packageNames = data['packageNames'];
  // // logger(packageNames);

  // // Add all apps data into a list
  // for (var appData in data['appData']) {
  //   allAppsData.add(appData);
  // }

  // // Add data of apps that have been used into a list
  // for (var package in packageNames) {
  //   Map? appData = allAppsData.firstWhere(
  //     (data) => data.containsKey(package),
  //     orElse: () => null,
  //   );

  //   // logger('$appData');

  //   if (appData != null) {
  //     int timeUsedInSeconds = appData[package]["timeUsedOnAppInSeconds"];
  //     if (timeUsedInSeconds > 0) {
  //       usedAppsData.add(appData);
  //       finalUsedAppsData = removeDuplicates(usedAppsData);
  //       logger('$finalUsedAppsData');
  //       // logger('HomeScreen used apps: ${appData[package]['appName']}');
  //     }
  //   }
  // }
}

bool mapExistsInList(Map map, List list) {
  // Convert the map to a string for comparison
  String mapAsString = map.toString();

  // Check if the list contains the map
  return list.any((element) => element.toString() == mapAsString);
}