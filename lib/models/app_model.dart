// import 'dart:typed_data';
import 'package:isar/isar.dart';
part 'app_model.g.dart';

@Collection()
class App {
  Id id = Isar.autoIncrement;
  String appName;
  String packageName;
  String versionName;
  String? appIcon;
  bool isTracked;
  String timeUsedOnApp;
  String usageLimit;
  int timeUsedOnAppInSeconds;
  int usageLimitInSeconds;

  App({
    required this.appName,
    required this.packageName,
    required this.versionName,
    this.appIcon,
    required this.isTracked,
    required this.timeUsedOnApp,
    required this.usageLimit,
    required this.timeUsedOnAppInSeconds,
    required this.usageLimitInSeconds,
  });
}
