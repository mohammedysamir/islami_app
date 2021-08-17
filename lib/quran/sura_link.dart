



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/sura_content/sura_content_arguments.dart';
import 'package:islami/sura_content/sura_content.dart';

class SuraLink extends StatelessWidget {
  const SuraLink ({Key? key, required this.suraNumber, required this.text, this.decoration, this.suraName}) : super(key: key);

  final suraNumber;
  final suraName;
  final decoration;
  final text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          SuraContent.routeName,
          arguments: SuraContentArguments(
              suraNumber,
              suraName
          ),
        );
      },
      child: Container(
          alignment: Alignment.center,
          decoration: decoration,
          child: Text(text, style: Theme.of(context).textTheme.bodyText2),
      ),
    );
  }
}
