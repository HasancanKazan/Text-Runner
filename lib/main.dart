import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:marquee/marquee.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  int typeCharLength = 0;
  int step = 0;
  String lorem =
      "                                      Teknik Lisede yazılım dalından 2014 yılında mezun oldum.2015 yılında Dumlupınar Üniversitesinde Bilgisayar Mühendisliği bölümünde eğitim görmeye başladım ve 2019 haziran ayı itibari ile mezun oldum.Şuan bir yazılım firmasında yazılım uzmanı olarak çalışmaktayım.Eğitim hayatım boyunca web projeleri geliştirme,masaüstü uygulamaları ve android uygulamaları geliştirmek üzerine çalışmalar yaptım ve buna şuanda devam ediyorum.Sizlere eğitim serilerimde yapmış olduğum hataları minumuma indirerek eğitim sonunda öğrendiğimiz teknolojilerle projeler yapabiliyor olma yetkinliğini kazandırabilmek istiyorum."
          .toLowerCase()
          .replaceAll(".", "")
          .replaceAll(",", "");
  double score = 0.0;
  int lastTypeAt;

  void updateLastTypeAt() {
    this.lastTypeAt = DateTime.now().millisecondsSinceEpoch;
  }

  void onType(String value) {
    updateLastTypeAt();
    String trimmedValue = lorem.trimLeft();

    setState(() {
      if (trimmedValue.indexOf(value.toLowerCase()) != 0)
        step = 2;
      else {
        typeCharLength = value.length;
      }
    });
  }

  void onStartClick() {
    setState(() {
      updateLastTypeAt();
      step++;
    });

    var timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int now = DateTime.now().millisecondsSinceEpoch;
      //OYUN BİTTİ
      setState(() {
        if (now - lastTypeAt > 4000) {
          timer.cancel();
          step++;
        }
      });
    });
  }

  void tryAgain() {
    setState(() {
      typeCharLength = 0;
      step = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var shownWidget;

    if (step == 0)
      shownWidget = <Widget>[
        Text("Hck ile flutter öğreniyorum"),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: RaisedButton(
            onPressed: onStartClick,
            child: Text("Başlamalısın !!"),
          ),
        )
      ];
    else if (step == 1)
      shownWidget = <Widget>[
        Text('$typeCharLength'),
        Container(
          height: 40,
          child: Marquee(
            text: lorem,
            style: TextStyle(fontSize: 24, letterSpacing: 2),
            scrollAxis: Axis.horizontal,
            blankSpace: 20.0,
            velocity: 100.0,
            startPadding: 0,
            accelerationDuration: Duration(seconds: 18),
            accelerationCurve: Curves.ease,
            decelerationDuration: Duration(milliseconds: 500),
            decelerationCurve: Curves.easeOut,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32, right: 16, left: 16),
          child: TextField(
            onChanged: onType,
            autofocus: true,
            //obscureText: true,  Bu alanı açarsak şifre şeklinde text girişi olur
            decoration: InputDecoration(
                labelText: "Text Input", border: OutlineInputBorder()),
          ),
        )
      ];
    else
      shownWidget = <Widget>[
        Text("GAME OVER MY DEAR FRIEND YOUR SCORE :$typeCharLength TRY AGAIN"),
        RaisedButton(
          onPressed: tryAgain,
          child: Text("Yeniden Başla.."),
        )
      ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Runner App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: shownWidget,
        ),
      ),
    );
  }
}
