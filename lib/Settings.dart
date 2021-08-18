import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/BottomNavBar.dart';
import 'package:islami/AppConfig.dart';
import 'package:islami/utility/IslamiScaffold.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);
  static const routeName = "Settings";

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late bool isDark;
  late AppConfigProvider provider;


  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    isDark = provider.themeMode == ThemeMode.dark;
    return IslamiScaffold(
      bottomNavBarCurrentIndex: BottomNavBar.settingsIndex,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.88,
        child: Stack(children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: InkWell(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(7.0, 0, 8.0, 0),
                        child: Image.asset(
                          'assets/images/globe.png',
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.language,
                        style: TextStyle(
                            fontSize: 22),
                        textAlign: TextAlign.start,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: Text(
                            provider.currentLanguage=="en"?"English":"اللغة العربية",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      )
                    ],
                  ),
                  onTap: onLanguageChange,
                ),
              ),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: Image.asset(
                    'assets/images/night_mode.png',
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.theme,
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.start,
                ),
                Expanded(
                  child: Container(
                    alignment: provider.currentLanguage == "en"
                        ? Alignment.topRight
                        : Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Switch(
                        value: isDark,
                        activeColor: Colors.white,
                        onChanged: (val) {
                          setState(() {
                            isDark = val;
                            print(isDark);
                          });
                          provider.toggleTheme();
                        },
                      ),
                    ),
                  ),
                ),
              ]),
            ],
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ]),
      ),
    );
  }

  void onLanguageChange() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      child: Text(
                        ' اللغة العربية',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () => {
                        setState(() {
                          provider.changeLanguage("ar");
                        })
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      child: Text(
                        'English language',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () => {
                        setState(() {
                          provider.changeLanguage("en");
                        })
                      },
                    ),
                  )
                ],
              ),
            ));
  }
}
