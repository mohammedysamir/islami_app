import 'package:flutter/material.dart';
import 'package:islami/Hadeth/HadethContent.dart';

class HadethLink extends StatelessWidget {
  const HadethLink(
      {Key? key, required this.hadethNumber, this.decoration, this.hadethName})
      : super(key: key);

  final hadethNumber;
  final hadethName;
  final decoration;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            HadethContent.routeName,
            arguments: HadethArguements(hadethNumber, hadethName),
          );
          // from https://flutter.dev/docs/cookbook/navigation/navigate-with-arguments
          // e.g:
          // Navigator.pushNamed(
          //   context,
          //   "/sura_screen",
          //   arguments: suraNumber,
          // );

          // or

          // from https://flutter.dev/docs/cookbook/navigation/passing-data
          // e.g: Navigator.push(context, materialPageRoute(builder: (context) => SuraScreen(suraNumber: this.suraNumber))
          //loading bar
        },
        child: Container(
          alignment: Alignment.center,
          decoration: decoration,
          child: Text(hadethName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ));
  }
}

class HadethArguements {
  int hadethNumber = 0;
  String hadethName = "";

  HadethArguements(this.hadethNumber, this.hadethName);
}
