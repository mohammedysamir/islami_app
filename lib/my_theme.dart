import 'package:flutter/material.dart';

class MyThemeData{
  static const darkThemeYellowColor = Color(0xFFFACC1D);
  static const whiteThemeBlackColor = Color(0xFF242424);

  static final lightTheme =  ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: Colors.white,
      backgroundColor: Colors.black,
      accentColor: Color(0xFFF8F8F8),
      brightness: Brightness.light,

      textTheme: const TextTheme(
        bodyText1: TextStyle(fontSize: 14.0, color: whiteThemeBlackColor),
        bodyText2: TextStyle(fontSize: 14.0, color: Colors.black),
        button: TextStyle(fontSize: 26.0, color: Colors.white),
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(whiteThemeBlackColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: BorderSide(color: whiteThemeBlackColor)
              )
          ),
        ),
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: Colors.white,
        selectedItemColor: whiteThemeBlackColor,
        backgroundColor: Color(0xFFB79F9F),
        showSelectedLabels: true,
        showUnselectedLabels: false,
      )
  );



  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: Colors.black,
    backgroundColor: Colors.white,
    brightness: Brightness.dark,
    accentColor: Color(0x80141A2E),

    textTheme: const TextTheme(
      bodyText1: TextStyle(fontSize: 14.0, color: darkThemeYellowColor),
      bodyText2: TextStyle(fontSize: 14.0, color: Colors.white),
      button: TextStyle(fontSize: 26.0, color: Colors.black),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(darkThemeYellowColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
                side: BorderSide(color: darkThemeYellowColor)
            )
        ),
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.white,
      selectedItemColor: darkThemeYellowColor,
      backgroundColor: Color(0xFF141A2E),
      showSelectedLabels: true,
      showUnselectedLabels: false,
    )
  );
}
