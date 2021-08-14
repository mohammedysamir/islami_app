import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/quran/sura_list.dart';
import 'package:islami/BottomNavBar.dart';

class HadethScreen extends StatefulWidget {
  static const routeName = "hadeth_list";

  @override
  HadethScreenState createState() => HadethScreenState();
}

class HadethScreenState extends State<HadethScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/bg3.png"), fit: BoxFit.fill),
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
                  width:MediaQuery.of(context).size.width,
                  height:MediaQuery.of(context).size.height*0.25 ,
                  alignment: Alignment.center,
                  child:
                  Image(image: AssetImage("assets/images/basmala_icon.png")),
                )),
            //Add hadeth list
            BottomNavBar(2),
          ],
        ),
      ),
    );
  }
}
