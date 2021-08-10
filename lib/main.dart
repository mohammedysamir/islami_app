import 'dart:math';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'background.dart';
import 'dart:math' as math;

void main()=>(runApp(myApp()));
class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasbeh page',
      home: myHomepage(),
    );
  }}