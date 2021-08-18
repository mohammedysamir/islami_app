import 'package:flutter/material.dart';
import 'package:islami/utility/get_file_data.dart';
import 'package:islami/utility/IslamiScaffold.dart';

class SuraContent extends StatefulWidget {
  const SuraContent({Key? key, required this.args}) : super(key: key);

  static const String routeName = "/sura_content";


  final args;
  @override
  State<SuraContent> createState() => _SuraContentState();
}

class _SuraContentState extends State<SuraContent> {
  late Future<String> futureSuraContent;

  Future<String> getSuraContent(args) async {
    String suraNumber = args.suraNumber.toString();
    String data = await getFileData("assets/sura_content/$suraNumber.txt");
    int cnt = 1;
    data = data.trim();
    data += '\n';
    for (int i = 0; i < data.length; ++i){
      if (data[i] == '\n') {
        data = data.replaceFirst('\n', ' ($cnt) ');
        cnt++;
      }
    }
    data = data.replaceAll(new RegExp(r"\s+"), "  ");

    return data;
  }

  @override
  void initState() {
    super.initState();
    futureSuraContent = getSuraContent(widget.args);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return IslamiScaffold(
      bottomNavBarCurrentIndex: -1,
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
                              child: Text("سورة ${widget.args.suraName}", style: Theme.of(context).textTheme.bodyText1)
                          ),
                          Image.asset(
                            isDarkMode
                                ?"assets/images/Icon_play_dark.png"
                                :"assets/images/Icon_play1.png")
                        ],
                      ),
                    ),
                    Image.asset(
                        isDarkMode?"assets/images/Line4_dark.png"
                        :"assets/images/Line4.png"),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text("بسم الله الرحمن الرحيم", style: Theme.of(context).textTheme.bodyText1)
                    ),
                    FutureBuilder<String>(
                        future: futureSuraContent,
                        builder: (context, snapshot) {
                          if (snapshot.hasData){
                            return Expanded(
                              flex: 9,
                              child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(snapshot.data!, style: Theme.of(context).textTheme.bodyText1)
                              ),
                            );
                          }
                          else if (snapshot.hasError){
                            return Text("${snapshot.error}");
                          }

                          return const CircularProgressIndicator();
                        }
                    )
                  ],
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}
