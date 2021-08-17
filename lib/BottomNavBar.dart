import 'package:flutter/material.dart';
import 'package:islami/Hadeth/HadethScreen.dart';
import 'package:islami/quran/quran_screen.dart';
import 'package:islami/radio.dart';
import 'package:islami/tasbe7.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class BottomNavBar extends StatefulWidget {
  static late int currentIndex;

  BottomNavBar(int index) {
    currentIndex = index;
  }

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  get currentIndex => BottomNavBar.currentIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.12,
      child: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 183, 147, 95),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        selectedFontSize: 12,
        unselectedItemColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        unselectedFontSize: 12,
        currentIndex: currentIndex,
        onTap: onItemTapped,
        iconSize: 40,
        elevation: 15,
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/radio.png"),
                color: currentIndex == 0 ? Colors.black : Colors.white,
              ),
              label:AppLocalizations.of(context)!.radio ),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/sebha.png"),
                color: currentIndex == 1 ? Colors.black : Colors.white,
              ),
              label: AppLocalizations.of(context)!.eltasbeh),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/quran-quran-svgrepo-com.png"),
                color: currentIndex == 2 ? Colors.black : Colors.white,
              ),
              label: AppLocalizations.of(context)!.alahadis),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/quran.png"),
                color: currentIndex == 3 ? Colors.black : Colors.white,
              ),
              label: AppLocalizations.of(context)!.alquran),
        ],
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      Navigator.pop(context);
      if (index == 0) {
        Navigator.pushNamed(context, RadioScreen.routeName);
      }
      if (index == 1) {
        Navigator.pushNamed(context, Tasbe7.routeName);
      }
      if (index == 2) {
        Navigator.pushNamed(context,HadethScreen.routeName);
      }
      if (index == 3) {
        Navigator.pushNamed(context, QuranScreen.routeName);
      }
    });
  }
}
