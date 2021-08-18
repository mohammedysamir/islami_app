import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islami/Hadeth/HadethScreen.dart';
import 'package:islami/quran/QuranScreen.dart';
import 'package:islami/Radio.dart';
import 'package:islami/sura_content/SuraContent.dart';
import 'package:islami/sura_content/SuraContentArguments.dart';
import 'package:islami/Tasbe7.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/AppConfig.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:islami/Settings.dart';
import 'Hadeth/HadethContent.dart';
//void main() => runApp(SplashWidget());

import 'MyTheme.dart';

void main() => runApp(SplashWidget());

class SplashWidget extends StatelessWidget {

  const SplashWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

return ChangeNotifierProvider(
     create: (buildcontext)=>AppConfigProvider(),
     builder: (buildcontext,widget){
       final provider= Provider.of<AppConfigProvider>(buildcontext);
       return MaterialApp(
      localizationsDelegates: [
    AppLocalizations.delegate, // Add this line
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: AppLocalizations.supportedLocales,
  locale: Locale.fromSubtags(languageCode: provider.currentLanguage ),

      themeMode: provider.themeMode,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,

      routes: {
        Splash.routeName: (context) => Splash(),
        QuranScreen.routeName: (context) => QuranScreen(),
        Tasbe7.routeName:(context) =>Tasbe7(),
        RadioScreen.routeName:(context) => RadioScreen(),
        HadethScreen.routeName:(context)=>HadethScreen(),
        HadethContent.routeName:(context)=>HadethContent(),
      Settings.routeName:(context)=>Settings()
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
                      Image.asset(
                          isDarkMode ?"assets/images/logo2_dark.png"
                          :"assets/images/logo2.png"),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 50.0, 8.0, 0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                  isDarkMode?"assets/images/route gold_dark.png"
                                  :"assets/images/route gold.png"),

                            ]),
                      )
                    ]),
              ),
            ),
          ],
        ));
  }
}
