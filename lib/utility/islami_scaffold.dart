



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../BottomNavBar.dart';

class IslamiScaffold extends StatelessWidget {
  const IslamiScaffold({
    Key? key,
    required this.child,
    required this.bottomNavBarCurrentIndex
  }) : super(key: key);

  final Widget child;
  final int bottomNavBarCurrentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/bg.png"), fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("إسلامي"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(child: this.child),
            this.bottomNavBarCurrentIndex == -1 ?
            Container() : BottomNavBar(currentIndex: this.bottomNavBarCurrentIndex),
          ],
        ),
      ),
    );
  }
}
