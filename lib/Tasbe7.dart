import 'package:flutter/material.dart';
import 'package:islami/utility/IslamiScaffold.dart';
import 'package:islami/BottomNavBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Tasbe7 extends StatefulWidget {
  static String routeName = '/tasbe7';

  @override
  _Tasbe7State createState() => _Tasbe7State();
}

class _Tasbe7State extends State<Tasbe7> with TickerProviderStateMixin {
  late AnimationController _controller;
  double start = 0.0;
  double end = 1.0;
  int numberoftasbe7 = 0;
  int numberoftasbe7tobeshown = 0;
  String du3a2 = 'سبحان الله';

  @override
  void initState() {
    // initialize our animation controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this, // when it should generate value
    );
    super.initState();
  }

  @override
  void dispose() {
    // to avoid memory leaks
    _controller.dispose();
    super.dispose();
  }

// tweens are like modifiers for an animation. they can change its range or even it output type
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return IslamiScaffold(
      bottomNavBarCurrentIndex: BottomNavBar.tasbe7ScreenIndex,
      child: Column(
        children: [
          Expanded(
            child: Image(
              image: AssetImage(
                  isDarkMode?'assets/images/head of seb7a_dark.png'
                  :'assets/images/head of seb7a.png'),
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            flex:2,
            child: RotationTransition(
              turns: Tween(begin: start, end: end).animate(_controller)
                ..addStatusListener((status) {
                  if (status == AnimationStatus.completed)
                    _controller.reverse();
                }),
              child: Image(
                image: AssetImage(
                    isDarkMode?'assets/images/body of seb7a_dark.png'
                    :'assets/images/body of seb7a.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                AppLocalizations.of(context)!.numberoftasbeh,
              ),
            ),
          ),
          Expanded(
            child: Text(
              numberoftasbe7tobeshown.toString(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              increment();
              _controller.forward();
            },
            child: Text(
              du3a2,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.button,
            ),
          ),
          Expanded(flex: 1, child: Container()),
        ],
      ),
    );
  }

  void increment() {
    setState(() {
      _controller.forward();
      if (numberoftasbe7 < 34) {
        numberoftasbe7tobeshown++;
        numberoftasbe7++;
        du3a2 = 'سبحان الله';
      }
      if (numberoftasbe7 != 0 && numberoftasbe7 == 34) {
        numberoftasbe7tobeshown = 0;
        numberoftasbe7++;
        du3a2 = 'الحمد لله';
      }
      if (numberoftasbe7 > 34) {
        numberoftasbe7tobeshown++;
        numberoftasbe7++;
        du3a2 = 'الحمد لله';
      }
      if (numberoftasbe7 != 0 && numberoftasbe7 == 69) {
        numberoftasbe7tobeshown = 0;
        numberoftasbe7++;
        du3a2 = 'الله اكبر';
      }
      if (numberoftasbe7 > 69) {
        numberoftasbe7tobeshown++;
        numberoftasbe7++;
        du3a2 = 'الله اكبر';
      }
      if (numberoftasbe7 == 105) {
        numberoftasbe7tobeshown = 0;
        numberoftasbe7 = 0;
        du3a2 = 'سبحان الله';
      }
    });
  }
}
