



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/quran/SuraLink.dart';

import '../MyTheme.dart';

class SuraListEntry extends StatelessWidget {
  const SuraListEntry({Key? key, required this.suraNumber, required this.suraName, required this.suraSize}) : super(key: key);

  final int suraNumber;
  final String suraName;
  final int suraSize;

  @override
  Widget build(BuildContext context) {
    final borderSide = Theme
        .of(context)
        .brightness == Brightness.dark ?
    MyThemeData.darkThemeBorderSide : MyThemeData.lightThemeBorderSide;

    return Row(
      children: [
        Expanded(
          child: SuraLink(
            suraNumber: this.suraNumber,
            suraName: this.suraName,
            decoration: BoxDecoration(
                border: Border(
                  right: borderSide,
                )
            ),
            text: this.suraSize.toString(),
          ),
        ),
        Expanded(
          child: SuraLink(
            suraNumber: this.suraNumber,
            suraName: this.suraName,
            decoration: BoxDecoration(
                border: Border(
                  // right: borderSide,
                )
            ),
            text: this.suraName,
          ),
        ),
      ],
    );
  }
}
