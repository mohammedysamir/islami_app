import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
                isDarkMode
                    ?"assets/images/bg2_dark.png"
                :"assets/images/bg2.png"), fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title:  Text(AppLocalizations.of(context)!.eslami,),
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
