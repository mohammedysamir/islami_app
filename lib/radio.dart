import 'package:flutter/material.dart';
import 'package:islami/BottomNavBar.dart';

class RadioScreen extends StatelessWidget {
  static const String routeName = 'radio';

  const RadioScreen({Key? key}) : super(key: key);

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
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/radio_image.png', fit: BoxFit.fill),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
                  child: Text(
                    'اذاعة القرآن الكريم',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/images/Icon_previous.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/Icon_play.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset('assets/images/Icon_next.png',
                        fit: BoxFit.cover),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 229, 0, 0),
                  child: BottomNavBar(0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
