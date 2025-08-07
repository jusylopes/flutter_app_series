import 'package:flutter/material.dart';
import 'package:flutter_app_series/utils/app_theme.dart';

class AppThemeViewModel extends ChangeNotifier {
  bool isDark = false;
  AppTheme myTheme = AppTheme(seedColor: Color(0xff8716d5));

  ThemeData get lightTheme => myTheme.lightTheme;
  ThemeData get darkTheme => myTheme.darkTheme;

  void switchTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
