import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier{
  static late SharedPreferences sharedPreferences; //1. declare sharedPref object

  static Future init() async{
    sharedPreferences = await SharedPreferences.getInstance(); //2. init sharedPref object

  }
  String currentLanguage= "en";
  void changeLanguage(String language){
    if(currentLanguage==language)
      return;
    else{
  currentLanguage=language;
  saveLanguage(language);
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
    saveTheme(themeMode);
    notifyListeners();
  }

  static Future saveLanguage(String language) async{
    sharedPreferences.setString("Language", language);
  }

  static String getLanguage(){
    return sharedPreferences.getString("Language").toString();
  }

  static Future saveTheme(ThemeMode theme) async{
    String mode="";
    if(theme == ThemeMode.light) mode = "light";
    else mode = "dark";
    sharedPreferences.setString("Theme", mode);
  }

  static ThemeMode getTheme(){
    String currentTheme=sharedPreferences.getString("Theme").toString().toLowerCase();
    if(currentTheme == "light") return ThemeMode.light;
    else return ThemeMode.dark;
  }
}
