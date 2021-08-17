import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami/Hadeth/HadethContent.dart';
import 'package:islami/Hadeth/HadethScreen.dart';
import 'package:islami/quran/quran_screen.dart';
import 'package:islami/radio.dart';
import 'package:islami/sura_content/sura_content.dart';
import 'package:islami/sura_content/sura_content_arguments.dart';
import 'package:islami/tasbe7.dart';

import 'my_theme.dart';

void main() => runApp(SplashWidget());

class SplashWidget extends StatelessWidget {

  const SplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      themeMode: ThemeMode.dark,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,

      routes: {
        Splash.routeName: (context) => Splash(),
        QuranScreen.routeName: (context) => QuranScreen(),
        Tasbe7.routeName:(context) =>Tasbe7(),
        RadioScreen.routeName:(context) => RadioScreen(),
        HadethScreen.routeName:(context)=>HadethScreen(),
        HadethContent.routeName:(context)=>HadethContent()
      },

      onGenerateRoute: (settings) {
        if (settings.name == SuraContent.routeName){
          final args = settings.arguments as SuraContentArguments;

          return MaterialPageRoute(
            builder: (context) {
              return SuraContent(args: args);
            },
          );
        }
      },

      debugShowCheckedModeBanner: false,

      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  static const routeName = '/splash';

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),
            () => Navigator.pushReplacementNamed(
              context,
              QuranScreen.routeName
            ));
  }

  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
        body: Stack(
          children: [
            Container(
              child: Image.asset(
                  isDarkMode ?"assets/images/bg_dark.png"
                  :"assets/images/bg.png", fit: BoxFit.fill),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 200.0, 8.0, 0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/logo2.png"),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 50.0, 8.0, 0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/route gold.png"),
                              Text(
                                "supervised by Mohamed Nabil",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 183, 147, 95),
                                  fontSize: 18,
                                ),
                              )
                            ]),
                      )
                    ]),
              ),
            ),
          ],
        ));
  }
}
