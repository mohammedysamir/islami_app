import 'package:flutter/material.dart';
import 'package:islami/BottomNavBar.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);
  static const routeName = "Settings";

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.88,
            child: Stack(children: [
              Container(
                child: Image.asset(
                  'assets/images/bg3.png',
                  fit: BoxFit.fitWidth,
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.88,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: InkWell(
                      child: Text(
                        'Language',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      onTap: onLanguageChange,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: InkWell(
                      child: Text(
                        'Theme',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      onTap: onThemeChange,
                    ),
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ]),
          ),
          Container(
            child: BottomNavBar(4),
          )
        ],
      ),
    );
  }

  void onLanguageChange() {
    showModalBottomSheet<void>(
        context: context,
        builder: (context) => Container(
              child: Column(
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
                      onTap: null,
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
                      onTap: null,
                    ),
                  )
                ],
              ),
            ));
  }

  void onThemeChange() {
    showModalBottomSheet<void>(
        context: context,
        builder: (context) => Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      child: Text(
                        'Dark',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                      onTap: null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      child: Text(
                        'Light',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                      onTap: null,
                    ),
                  )
                ],
              ),
            ));
  }
}
