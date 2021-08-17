import 'package:flutter/material.dart';
import 'package:islami/BottomNavBar.dart';
import 'package:islami/utility/islami_scaffold.dart';

class RadioScreen extends StatelessWidget {
  static const String routeName = 'radio';

  const RadioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IslamiScaffold(
      bottomNavBarCurrentIndex: BottomNavBar.radioScreenIndex,
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: Image.asset('assets/images/radio_image.png',
                  fit: BoxFit.fill)),
          Expanded(
            child: Text(
              'اذاعة القرآن الكريم',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
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
                Image.asset('assets/images/Icon_next.png', fit: BoxFit.cover),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
