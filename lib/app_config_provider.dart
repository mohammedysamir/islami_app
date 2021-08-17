



import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  //task to save this theme mode in shared preferences
  ThemeMode themeMode = ThemeMode.system;

  void toggleTheme() {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    }
    else {
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  }

}