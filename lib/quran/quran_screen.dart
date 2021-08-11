import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/quran/sura_list.dart';
import 'package:islami/tasbe7.dart';

class QuranScreen extends StatefulWidget {
  static const routeName = "quran_list";
  @override
  QuranScreenState createState() => QuranScreenState();
}

class QuranScreenState extends State<QuranScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/bg3.png"), fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("إسلامي", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child:
                  Image(image: AssetImage("assets/images/sura_list_icon.png")),
            )),
            Expanded(
              child: SuraList(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 108,
              child: BottomNavigationBar(
                backgroundColor: Color.fromARGB(255, 183, 147, 95),
                selectedIconTheme: IconThemeData(color: Colors.black, size: 20),
                unselectedIconTheme:
                    IconThemeData(color: Colors.white, size: 20),
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.black,
                selectedFontSize: 12,
                unselectedItemColor: Colors.white,
                showSelectedLabels: true,
                showUnselectedLabels: false,
                unselectedFontSize: 12,
                currentIndex: 3,
                onTap: onItemTapped,
                elevation: 15,
                items: [
                  BottomNavigationBarItem(
                      icon: Image.asset("assets/images/radio.png"),
                      label: "راديو"),
                  BottomNavigationBarItem(
                      icon: Image.asset("assets/images/sebha.png"),
                      label: "التسبيح"),
                  BottomNavigationBarItem(
                      icon: Image.asset(
                          "assets/images/quran-quran-svgrepo-com.png"),
                      label: "الاحاديث"),
                  BottomNavigationBarItem(
                      icon: Image.asset("assets/images/quran.png"),
                      label: "القرآن"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      Navigator.pop(context);
      if(index == 0) {}
      if(index == 1) {
        Navigator.pushNamed(context,Tasbe7.routeName);
      }
      if(index == 2) {
      }
      if(index == 3) {
        Navigator.pushNamed(context,QuranScreen.routeName);
      }
    });
  }
}
