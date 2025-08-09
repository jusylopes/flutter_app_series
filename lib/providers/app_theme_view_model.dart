import 'package:flutter/material.dart';
import 'package:flutter_app_series/utils/app_theme.dart';

class AppThemeViewModel extends ChangeNotifier {
  bool isDark = false;
  AppTheme myTheme = AppTheme(
    seedColor: const Color.fromARGB(255, 248, 39, 24),
  );

  ThemeData get lightTheme => myTheme.lightTheme;
  ThemeData get darkTheme => myTheme.darkTheme;

  void switchTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
