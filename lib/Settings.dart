import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/BottomNavBar.dart';
import 'package:islami/AppConfig.dart';
import 'package:islami/utility/islami_scaffold.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);
  static const routeName = "Settings";

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isDark = false;
  String currentChosenLanguage = "English";
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    isDark = isDarkMode;
    provider = Provider.of<AppConfigProvider>(context);
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
                        child: Image.asset('assets/images/globe.png'),
                      ),
                      Text(
                        'Language',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: Text(
                            currentChosenLanguage,
                            style: TextStyle(
                              fontSize: 22,
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
                  ),
                ),
                Text(
                  'Theme',
                  style:
                  TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Switch(
                        value: isDark,
                        activeColor: Colors.white,
                        onChanged: (value) {
                          setState(() {
                            isDark = value;
                            if (isDark) {
                            } else {}
                          });
                        },
                      ),
                    ),
                  ),
                )
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
        backgroundColor: Colors.transparent,
        builder: (context) => Container(
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: Colors.white),
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
                          currentChosenLanguage = "العربية";
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
                          currentChosenLanguage = "English";
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
