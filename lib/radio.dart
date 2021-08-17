import 'package:flutter/material.dart';
import 'package:islami/BottomNavBar.dart';
import 'package:islami/utility/islami_scaffold.dart';

class RadioScreen extends StatelessWidget {
  static const String routeName = 'radio';

  const RadioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.skip_previous,
                  semanticLabel: 'skip previous',
                ),
                Icon(
                  Icons.play_arrow_rounded,
                  semanticLabel: 'play',
                ),
                Icon(
                  Icons.skip_next,
                  semanticLabel: 'skip next',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
