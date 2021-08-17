import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/AppConfig.dart';
import 'package:provider/provider.dart';
import 'package:islami/splash.dart';
class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}
class _SideMenuState extends State<SideMenu> {
  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    provider =Provider.of<AppConfigProvider>(context);
    return Drawer(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 48,horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                Changelanguage();
              },
              child: Container(
                padding:EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  AppLocalizations.of(context)!.language),
              ),
            )
          ],
        ),
      ),
    );
  }

  void Changelanguage(){
    Navigator.pop(context);
    showModalBottomSheet(context: context, builder: (buildcontext){
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
            InkWell(
              onTap: (){
                provider.changeLanguage("en");
                },
              child: Container(
                padding:EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'English',
                  textAlign: TextAlign.center
                ),
              ),
            ),
            InkWell(
              onTap: (){
                provider.changeLanguage("ar");
                },
              child: Container(
                padding:EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'العربيه',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        
        
          ]
        ),
      );
    });
  }
}