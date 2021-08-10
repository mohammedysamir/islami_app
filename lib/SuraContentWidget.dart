import 'package:flutter/material.dart';

void main() => runApp(SuraContent());

class SuraContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SuraContent',
        home: Scaffold(
            appBar: AppBar(title: Text("إسلامي")),
            body: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20.0),
                    child: Row(children: [
                      Image.asset('assets/images/Back.png'),
                      Padding(
                        padding: const EdgeInsets.only(left: 100.0),
                        child: Image.asset('assets/images/islami.png'),
                      )
                    ]),
                  ),
                  Container(
                      child: Padding(
                        padding: EdgeInsets.all(50.0),
                        child: Row(
                          children: [
                            Text("Hello"),
                            Expanded(child: Image.asset('assets/images/Icon_awesome-play-circle.png')),
                          ],
                        ),
                      )
                  )
                ],
              ),
            )));
  }
}
