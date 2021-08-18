import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/quran/SuraList.dart';
import 'package:islami/BottomNavBar.dart';
import 'package:islami/utility/IslamiScaffold.dart';
class QuranScreen extends StatefulWidget {
  QuranScreen({Key? key});
  static const routeName = "/quran_list";

  @override
  QuranScreenState createState() => QuranScreenState();
}
class QuranScreenState extends State<QuranScreen> {
  @override
  Widget build(BuildContext context) {
    return IslamiScaffold(
      bottomNavBarCurrentIndex: BottomNavBar.quranScreenIndex,
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Image(image: AssetImage("assets/images/sura_list_icon.png")),
            ),
          ),
          SuraList(),
        ],
      ),
    );
  }
}
