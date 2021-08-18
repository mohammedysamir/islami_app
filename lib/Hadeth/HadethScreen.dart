import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/BottomNavBar.dart';
import 'package:islami/Hadeth/Hadeth_list.dart';
import 'package:islami/utility/IslamiScaffold.dart';

class HadethScreen extends StatefulWidget {
  static const routeName = "hadeth_list";

  @override
  HadethScreenState createState() => HadethScreenState();
}

class HadethScreenState extends State<HadethScreen> {
  @override
  Widget build(BuildContext context) {
    return IslamiScaffold(
      bottomNavBarCurrentIndex: BottomNavBar.hadethScreenIndex,
      child: Column(
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
          HadethList(),
        ],
      ),
    );
  }
}
