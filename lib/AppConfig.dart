import 'package:flutter/material.dart';
class AppConfigProvider extends ChangeNotifier{
  String currentLnaguage= "ar";
  void changeLanguage(String language){
    if(currentLnaguage==language)
      return;
    else{
  currentLnaguage=language;
  notifyListeners();
    }
  }

}