import 'package:flutter/material.dart';
import 'package:islami/sura_content.dart';
import 'package:islami/quran/quran_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "إسلامي",

      onGenerateRoute: (RouteSettings settings) {
        var routes = <String, WidgetBuilder>{
          QuranScreen.routeName: (context) => QuranScreen(),
          SuraContent.routeName: (context) => SuraContent(args: settings.arguments),
        };
        WidgetBuilder? builder = routes[settings.name];
        if (builder == null) return null;
        return MaterialPageRoute(builder: (context) => builder(context), settings: settings);
      },
      // routes: {
      //   QuranScreen.routeName: (context) => const QuranScreen(),
      //   SuraContent.routeName: (context) => const SuraContent(),
      // },

      initialRoute: QuranScreen.routeName,
    );
  }
}