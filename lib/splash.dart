import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   String routeName="Splash";
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: "Splash screen",
//         home: Scaffold(
//          body:Stack(
//            children: [
//              Container(child: Image.asset("assets/images/bg2.png")),
//              Center(
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: [
//                    Image.asset("assets/images/logo2.png"),
//                    Image.asset("assets/images/route gold.png")
//                  ]
//                ),
//              )
//            ],
//          )
//         ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          child: Image.asset("assets/images/bg2.png",fit:BoxFit.fill),
          width: MediaQuery.of(context).size.width,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 200.0, 8.0, 0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo2.png"),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 50.0, 8.0, 0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/route gold.png"),
                          Text(
                            "supervised by Mohamed Nabil",
                            style: TextStyle(
                              color: Color.fromARGB(255, 183, 147, 95),
                              fontSize: 18,
                            ),
                          )
                        ]),
                  )
                ]),
          ),
        ),
      ],
    ));
  }
}
