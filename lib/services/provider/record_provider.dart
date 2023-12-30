import 'package:flutter/material.dart';
import 'package:time_guard/models/records_model.dart';

class RecordProvider extends ChangeNotifier {
  final List<Record> _records = [];

  List<Record> get records => _records;

  void addRecord(Record record) {
    _records.add(record);
    notifyListeners();
  }

  void clear() {
    _records.clear();
    notifyListeners();
  }
}