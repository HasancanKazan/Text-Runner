import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAppHome(),
    );
  }
}

class MyAppHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppHomeState();
  }
}

// Sadece bu dosya içerisinde kullanabiliriz _ dediğimiz için başka dosyadan import edilemez.
class _MyAppHomeState extends State<MyAppHome> {
  @override
  Widget build(BuildContext context) {
    String lorem =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Runner App"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 100),
            height: 40,
            child: Marquee(
              text: lorem,
              style: TextStyle(fontSize: 24, letterSpacing: 2),
              scrollAxis: Axis.horizontal,
              blankSpace: 20.0,
              velocity: 100.0,
              pauseAfterRound: Duration(seconds: 10),
              startPadding: 0,
              accelerationDuration: Duration(seconds: 5),
              accelerationCurve: Curves.linear,
              decelerationDuration: Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,
            ),
            //     child: RichText(
            //   maxLines: 1,
            //   softWrap: false,
            //   text: TextSpan(
            //       style: TextStyle(
            //         fontSize: 24,
            //         letterSpacing: 2,
            //         color: Colors.black,
            //       ),
            //       children: <TextSpan>[
            //         TextSpan(text: "HCK"),
            //         TextSpan(
            //           text: lorem,
            //           style: TextStyle(
            //               fontSize: 24, letterSpacing: 2, color: Colors.blue),
            //         ),
            //       ]),
            // )

            //margin: EdgeInsets.only(left: 100),
            // child: Text(
            //   lorem,
            //   maxLines: 1,
            //   softWrap: false,
            //   style:
            //       TextStyle(fontSize: 24, letterSpacing: 2, color: Colors.cyan),
            // ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, right: 16, left: 16),
            child: TextField(
              //obscureText: true,  Bu alanı açarsak şifre şeklinde text girişi olur
              decoration: InputDecoration(
                  labelText: "Text Input", border: OutlineInputBorder()),
            ),
          )
        ],
      )),
    );
  }
}
