import 'package:flutter/material.dart';
import 'package:islami/BottomNavBar.dart';
import 'package:islami/Radio/RadioWidget.dart';
import 'package:islami/utility/IslamiScaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
              AppLocalizations.of(context)!.quranchannel,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          RadioWidget(),
        ],
      ),
    );
  }
}
