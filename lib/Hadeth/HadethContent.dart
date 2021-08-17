import 'package:flutter/material.dart';
import 'package:islami/Hadeth/HadethLink.dart';
import 'package:islami/utility/get_file_data.dart';

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
    args = ModalRoute.of(context)!.settings.arguments as HadethArguements;
    return MaterialApp(
        title: 'HadethContent',
        home: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg3.png"), fit: BoxFit.fill),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: BackButton(
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title:
                  const Text("إسلامي", style: TextStyle(color: Colors.black)),
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
            ),
            body: Column(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(
                      top: 35.0, right: 35.0, left: 35.0, bottom: 70.0),
                  decoration: BoxDecoration(
                    color: Color(0x80F2F4F6),
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
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ),
                        Image.asset("assets/images/Line_4.png"),
                        FutureBuilder<String>(
                            future: getHadethContent(args),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Expanded(
                                  flex: 9,
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      padding: EdgeInsets.all(15.0),
                                      child: Text(snapshot.data!)),
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
          ),
        ));
  }
}
