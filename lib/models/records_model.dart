// import 'dart:typed_data';
import 'package:isar/isar.dart';
part 'records_model.g.dart';

@Collection()
class Record{
  Id id = Isar.autoIncrement;
  String date;
  int noOfAppsUsed;
  String mostUsedApp;
  String timeForMostUsedApp;
  int timeForMostUsedAppInSeconds;

  Record({
    required this.date,
    required this.noOfAppsUsed,
    required this.mostUsedApp,
    required this.timeForMostUsedApp,
    required this.timeForMostUsedAppInSeconds,
  });
}
