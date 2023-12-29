import 'package:flutter/material.dart';
import 'package:time_guard/models/app_model.dart';

class AppProvider extends ChangeNotifier {
  final List<App> _allApps = [];
  final List<App> _trackedApps = [];
  final List<App> _untrackedApps = [];

  List<App> get allApps => _allApps;
  List<App> get trackedApps => _trackedApps;
  List<App> get untrackedApps => _untrackedApps;


  void addAllApps(App app) {
    _allApps.add(app);
    notifyListeners();
  }

  void addTrackedApp(App app) {
    _trackedApps.add(app);
    notifyListeners();
  }

  void addUntrackedApp(App app) {
    _untrackedApps.add(app);
    notifyListeners();
  }

  void removeTrackedApp(App app) {
    _trackedApps.remove(app);
    notifyListeners();
  }

  void removeUntrackedApp(App app) {
    _untrackedApps.remove(app);
    notifyListeners();
  }

  void clear() {
    _allApps.clear();
    _trackedApps.clear();
    _untrackedApps.clear();
    notifyListeners();
  }
}