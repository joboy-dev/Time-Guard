import 'dart:typed_data';

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

bool mapExistsInList(Map map, List list) {
  // Convert the map to a string for comparison
  String mapAsString = map.toString();

  // Check if the list contains the map
  return list.any((element) => element.toString() == mapAsString);
}