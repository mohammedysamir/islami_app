import 'package:flutter/material.dart';
import 'package:islami/quran/quran_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "إسلامي",

      routes: {
        QuranScreen.routeName: (context) => const QuranScreen(),
        "/sura_content": (context) => const Text("Sura Content"),
      },

      initialRoute: QuranScreen.routeName,
    );
  }
}