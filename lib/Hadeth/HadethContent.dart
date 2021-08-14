import 'package:flutter/material.dart';
import 'package:islami/utility/get_file_data.dart';

class HadethContent extends StatefulWidget {
  const HadethContent({Key? key, required this.args}) : super(key: key);

  static const String routeName = "hadeth_content";

  final args;

  @override
  State<HadethContent> createState() => _HadethContentState();
}

class _HadethContentState extends State<HadethContent> {
  // late Future<String> futureHadethContent;
  String hadethContent = "";

  void getHadethContent(args) async {
    String hadethNumber = args.hadethNumber.toString();
    String data = await getFileData("assets/ahadeth/$hadethNumber.txt");
    List<String> ahadeth = data.split('\r\n#');
    hadethContent = ahadeth.elementAt(int.parse(hadethNumber));
  }

  @override
  void initState() {
    super.initState();
    // futureHadethContent = getHadethContent(widget.args);
    getHadethContent(widget.args);
  }

  @override
  Widget build(BuildContext context) {
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
                                  child: Text("${widget.args.hadethName}")),
                            ],
                          ),
                        ),
                        Image.asset("assets/images/Line_4.png"),
                        Expanded(child: Text(hadethContent), flex: 9)
                      ],
                    ),
                  ),
                )
                    // child: SuraList(),
                    ),
              ],
            ),
          ),
        ));
  }
}
