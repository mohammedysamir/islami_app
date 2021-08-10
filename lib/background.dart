import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class background extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
return Container(
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          // ignore: prefer_const_constructors
          image: DecorationImage(
            // ignore: prefer_const_constructors
            image: AssetImage('assets/bg3.png'),
           
          )
        ),
);
  }
}
const TextStyle textstyle=TextStyle( // to avoid code repition
  fontSize: 30.0,
fontWeight: FontWeight.bold,
color:Colors.black,
);