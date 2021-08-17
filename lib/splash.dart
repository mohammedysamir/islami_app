import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islami/Hadeth/HadethScreen.dart';
import 'package:islami/quran/quran_screen.dart';
import 'package:islami/radio.dart';
import 'package:islami/sidemenu.dart';
import 'package:islami/sura_content.dart'; 
import 'package:islami/tasbe7.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/AppConfig.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
//void main() => runApp(SplashWidget());

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
  locale: Locale.fromSubtags(languageCode: provider.currentLnaguage ),
      initialRoute: 'Splash',
      onGenerateRoute: (RouteSettings settings) {
        var routes = <String, WidgetBuilder>{
          Splash.routeName: (context) => Splash(),
          QuranScreen.routeName: (context) => QuranScreen(),
          Tasbe7.routeName:(context) =>Tasbe7(),
          SuraContent.routeName: (context) => SuraContent(args: settings.arguments),
          RadioScreen.routeName:(context) => RadioScreen(),
          HadethScreen.routeName:(context)=>HadethScreen(),
          HadethContent.routeName:(context)=>HadethContent()
        };
        WidgetBuilder? builder = routes[settings.name];
        if (builder == null) return null;
        return MaterialPageRoute(builder: (context) => builder(context), settings: settings);
      },

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
     }
    );
    
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  static const routeName = 'Splash';

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  route() {
    Navigator.pushNamed(context, QuranScreen.routeName);
  }

  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),
            () => Navigator.pushReplacement(context, route()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
        body: Stack(
          children: [
            Container(
              child: Image.asset("assets/images/bg2.png", fit: BoxFit.fill),
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
