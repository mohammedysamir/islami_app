import 'package:flutter/material.dart';
import 'package:islami/Hadeth/HadethLink.dart';
import 'package:islami/utility/get_file_data.dart';
import 'package:islami/utility/IslamiScaffold.dart';

import '../BottomNavBar.dart';

class HadethContent extends StatelessWidget {
  HadethContent({Key? key}) : super(key: key);

  static const String routeName = "hadeth_content";
  late final args;
  String hadethContent = "";

  Future<String> getHadethContent(args) async {
    String hadethNumber = args.hadethNumber.toString();
    String data = await getFileData("assets/ahadeth.txt");
    List<String> ahadeth = data.split('#');
    hadethContent = ahadeth.elementAt(int.parse(hadethNumber) - 1);
    hadethContent.replaceAll('\r\n', '');
    return hadethContent;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    args = ModalRoute.of(context)!.settings.arguments as HadethArguements;
    return IslamiScaffold(
      bottomNavBarCurrentIndex: BottomNavBar.hadethScreenIndex,
      child: Column(
        children: [
          Expanded(
              child: Container(
                margin: EdgeInsets.only(
                    top: 35.0, right: 35.0, left: 35.0, bottom: 70.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.all(15.0),
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "${args.hadethName}",
                                  style: Theme.of(context).textTheme.bodyText1)),
                          ],
                        ),
                      ),
                      Image.asset(
                          isDarkMode?"assets/images/Line4_dark.png"
                          :"assets/images/Line4.png"),
                      FutureBuilder<String>(
                          future: getHadethContent(args),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Expanded(
                                flex: 9,
                                child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    padding: EdgeInsets.all(15.0),
                                    child: Text(snapshot.data!,
                                    style: Theme.of(context).textTheme.bodyText1)),
                              );
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            return const CircularProgressIndicator();
                          })
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
