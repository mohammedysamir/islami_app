import 'package:flutter/material.dart';

void main() => runApp(SuraContent());

class SuraContent extends StatelessWidget {
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
                    color: Color(0xFFBB1616),

                  )
                  // child: SuraList(),
                )
              ],
            ),
          ),
        )
    );
  }
}
