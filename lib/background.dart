import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("assets/images/bg3.png", fit: BoxFit.fill),
      width: MediaQuery.of(context).size.width,
    );
  }
}

const TextStyle textstyle = TextStyle(
  // to avoid code repition
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);
