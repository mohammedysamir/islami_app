import 'package:flutter/material.dart';
import 'package:islami/SuraContentWidget.dart';
import 'package:islami/quran/quran_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "إسلامي",

      routes: {
        QuranScreen.routeName: (context) => const QuranScreen(),
        SuraContent.routeName: (context) => const SuraContent(),
      },

      initialRoute: QuranScreen.routeName,
    );
  }
}