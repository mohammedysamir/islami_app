



import 'package:flutter/material.dart';

class MyThemeData{

  static final lightTheme =  ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: Colors.black,
      backgroundColor: Colors.white,
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


  static const darkThemeYellowColor = Color(0xFFFACC1D);

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: Colors.black,
    backgroundColor: Colors.white,
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
