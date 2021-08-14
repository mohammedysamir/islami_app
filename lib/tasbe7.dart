import 'package:flutter/material.dart';
import 'background.dart';
import 'package:islami/BottomNavBar.dart';

class Tasbe7 extends StatefulWidget {
  static String routeName = 'tasbe7';

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
    return Stack(children: <Widget>[
      background(),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.849,
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'اسلامي',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Image(
                      image: AssetImage('assets/images/head of seb7a.png'),
                      height: 40.0,
                      width: 40.0,
                      fit: BoxFit.fitWidth,
                    ),
                    RotationTransition(
                      turns: Tween(begin: start, end: end).animate(_controller)
                        ..addStatusListener((status) {
                          if (status == AnimationStatus.completed)
                            _controller.reverse();
                        }),
                      child: Image(
                        image: AssetImage('assets/images/body of seb7a.png'),
                        height: 150.0,
                        width: 150.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      'عدد التسبيحات',
                      // ignore: prefer_const_constructors
                      style: textstyle,
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        increment();
                        _controller.forward();
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.grey),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side:
                                          BorderSide(color: Colors.white70)))),
                      child: Text(
                        numberoftasbe7tobeshown.toString(),
                        style: textstyle,
                      ),
                    ),
                    SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        color: Colors.brown[300],
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          du3a2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: BottomNavBar(1),
              ),
            ],
          ),
        ),
      )
    ]);
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
