import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme extends ChangeNotifier {
  AppTheme(this._isDark);

  bool get isDark => _isDark;
  bool _isDark;

  ThemeData buildTheme() {
    if (_isDark) {
      return ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.pink,
      );
    } else {
      return ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      );
    }
  }

  void changeMode() async {
    _isDark = !_isDark;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', _isDark);
    notifyListeners();
  }
}
