import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  String? _themeValue = 'system';
  String key = 'theme';

  String get themeValue => _themeValue!;

   Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    
    // check against null value
    _themeValue = prefs.getString(key) ?? 'system';
    notifyListeners();
  }

  Future<void> setThemeMode(String value) async {
    final prefs = await SharedPreferences.getInstance();
    _themeValue = value;
    
    prefs.setString(key, value);
    notifyListeners();
  }

  ThemeProvider() {
    _loadThemeMode();
  }
}