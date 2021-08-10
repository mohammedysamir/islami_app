import 'package:flutter/material.dart';


class SuraContent extends StatelessWidget {
  static const String routeName = "/sura_content";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SuraContent',
        home: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/bg3.png"), fit: BoxFit.fill),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: BackButton(color: Colors.black,onPressed:(){
                Navigator.pop(context);
              }),
              title: const Text("إسلامي", style: TextStyle(color: Colors.black)),
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
            ),
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top:35.0, right: 35.0, left: 35.0, bottom: 70.0),
                    decoration: BoxDecoration(
                      color: Color(0x80F2F4F6),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                      ),
                    ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Place holder" + "سورة "),
                            Image.asset("assets/images/Icon awesome-play.png")
                          ],
                      ),
                        ),
                        Image.asset("assets/images/Line_4.png"),
                        Expanded(
                            flex: 9,child:
                        Container(alignment: Alignment.topRight,
                        padding: EdgeInsets.only(top:5.0),
                            child: Text("بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ")))
                      ]
                    ),
                  ),
                  )
                  // child: SuraList(),
                ),
              ],
            ),
          ),
        )
    );
  }
}
