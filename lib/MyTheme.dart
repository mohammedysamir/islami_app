import 'package:flutter/material.dart';

class MyThemeData{
  static const lightThemeBorderSide = BorderSide(
    color: Color(0xFFB7935F),
    width: 3.0,
  );
  static const darkThemeBorderSide = BorderSide(
    color: Color(0xFFB7935F),
    width: 3.0,
  );

  static const lightThemeBlackColor = Color(0xFF242424);
  static const lightThemeYellowColor =Color(0xFFB7935F);
  static const darkThemeYellowColor = Color(0xFFFACC1D);

  static final lightTheme =  ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: Colors.white,
      backgroundColor: Colors.black,
      accentColor: Color(0xFFF8F8F8),
      brightness: Brightness.light,

      textTheme: const TextTheme(
        button: TextStyle(fontSize: 26.0, color: Colors.white),
        bodyText1: TextStyle(fontSize: 14.0, color: lightThemeBlackColor),
        bodyText2: TextStyle(fontSize: 14.0, color: Colors.black),
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
      ),

      iconTheme: IconThemeData(
        color:lightThemeYellowColor
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(lightThemeBlackColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: BorderSide(color: lightThemeBlackColor)
              )
          ),
        ),
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: Colors.white,
        selectedItemColor: lightThemeBlackColor,
        backgroundColor: lightThemeYellowColor,
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
      button: TextStyle(fontSize: 26.0, color: Colors.black),
      bodyText1: TextStyle(fontSize: 14.0, color: darkThemeYellowColor),
      bodyText2: TextStyle(fontSize: 14.0, color: Colors.white),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
    ),

      iconTheme: IconThemeData(
          color:darkThemeYellowColor,
          size: 40
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
