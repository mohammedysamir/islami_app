



import 'package:flutter/cupertino.dart';

class SuraLink extends StatelessWidget {
  const SuraLink ({Key? key, required this.suraNumber, required this.text, this.decoration}) : super(key: key);

  final suraNumber;
  final decoration;
  final text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/sura_content",
          arguments: suraNumber,
        );
        // TODO: navigate to sura screen
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
      },
      child: Container(
          alignment: Alignment.center,
          decoration: decoration,
          child: Text(text),
      ),
    );
  }
}
