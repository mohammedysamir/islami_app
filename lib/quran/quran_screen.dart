



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/quran/sura_list.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({Key? key}) : super(key: key);

  static const routeName = "/quran";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/bg3.png"), fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("إسلامي", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Image(image: AssetImage("assets/images/sura_list_icon.png")),
              )
            ),
            Expanded(
              child: SuraList(),
            )
          ],
        ),
      ),
    );
  }
}
