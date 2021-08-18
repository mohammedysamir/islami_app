import 'package:flutter/material.dart';
class AppConfigProvider extends ChangeNotifier{
  String currentLanguage= "en";
  void changeLanguage(String language){
    if(currentLanguage==language)
      return;
    else{
  currentLanguage=language;
  notifyListeners();
    }
  }

  ThemeMode themeMode = ThemeMode.light;

  void toggleTheme() {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    }
    else {
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  }

  void toggleLanguage(){

  }

}