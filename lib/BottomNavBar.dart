import 'package:flutter/material.dart';
import 'package:islami/Hadeth/HadethScreen.dart';
import 'package:islami/quran/QuranScreen.dart';
import 'package:islami/Radio.dart';
import 'package:islami/Tasbe7.dart';
import 'package:islami/Settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key, required this.currentIndex});

  static const int radioScreenIndex = 0;
  static const int tasbe7ScreenIndex = 1;
  static const int hadethScreenIndex = 2;
  static const int quranScreenIndex = 3;
  static const int settingsIndex = 4;

  final int currentIndex;

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.12,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        currentIndex: widget.currentIndex,
        onTap: onItemTapped,
        // iconSize: 40,
        elevation: 15,
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/radio.png"),
              ),
              label:AppLocalizations.of(context)!.radio ),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/sebha.png"),
              ),
              label: AppLocalizations.of(context)!.eltasbeh),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/quran-quran-svgrepo-com.png"),
              ),
              label: AppLocalizations.of(context)!.alahadis),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/quran.png"),
              ),
              label: AppLocalizations.of(context)!.alquran),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/settings.png"),
              ),
              label: AppLocalizations.of(context)!.settings),
        ],
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      Navigator.pop(context);
      if (index == BottomNavBar.radioScreenIndex) {
        Navigator.pushNamed(context, RadioScreen.routeName);
      }
      if (index == BottomNavBar.tasbe7ScreenIndex) {
        Navigator.pushNamed(context, Tasbe7.routeName);
      }
      if (index == BottomNavBar.hadethScreenIndex) {
        Navigator.pushNamed(context,HadethScreen.routeName);
      }
      if (index == BottomNavBar.quranScreenIndex) {
        Navigator.pushNamed(context, QuranScreen.routeName);
      }
      if(index == BottomNavBar.settingsIndex){
        Navigator.pushNamed(context,Settings.routeName);
      }
    });
  }
}
