import 'package:flutter/material.dart';
import 'package:islami/quran/quran_screen.dart';
import 'package:islami/radio.dart';
import 'package:islami/tasbe7.dart';

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
      height: MediaQuery.of(context).size.height*0.12 ,
      child: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 183, 147, 95),
        selectedIconTheme: IconThemeData(
          color: Colors.black,
          size: 20,
        ),
        unselectedIconTheme: IconThemeData(color: Colors.white, size: 20),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        selectedFontSize: 12,
        unselectedItemColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        unselectedFontSize: 12,
        currentIndex: currentIndex,
        onTap: onItemTapped,
        elevation: 15,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset("assets/images/radio.png"), label: "راديو"),
          BottomNavigationBarItem(
              icon: Image.asset("assets/images/sebha.png"), label: "التسبيح"),
          BottomNavigationBarItem(
              icon: Image.asset("assets/images/quran-quran-svgrepo-com.png"),
              label: "الاحاديث"),
          BottomNavigationBarItem(
              icon: Image.asset("assets/images/quran.png"), label: "القرآن"),
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
        //add hadeth page navigator
      }
      if (index == 3) {
        Navigator.pushNamed(context, QuranScreen.routeName);
      }
    });
  }
}
