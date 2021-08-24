import 'package:flutter/cupertino.dart';
import 'package:islami/Splash.dart';
import 'package:islami/AppConfig.dart';

Future main()async{  WidgetsFlutterBinding.ensureInitialized();await AppConfigProvider.init();runApp(SplashWidget());}