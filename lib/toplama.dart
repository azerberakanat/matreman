import 'package:deneme/randomlar.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';

import 'anaSayfa.dart';

class topsayfa extends StatefulWidget {
  @override
  _topsayfaState createState() => _topsayfaState();
}

Random random = new Random();
int randomNumbertop = random.nextInt(100) + 1;
Random random2 = new Random();
int randomNumbertop2 = random2.nextInt(100) + 1;

class _topsayfaState extends State<topsayfa> {
  @override
  Widget randomsayibutton(String rand) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => anaSayfa(),
        child: Text(
          rand,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
          maxLines: 1,
        ),
        color: Colors.blue,
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: 200.0,
        height: 45.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Uygulamadan Çıkmak istiyor musunuz?"),
        actions: <Widget>[
          TextButton(
            child: Text("Hayır"),
            onPressed: () => Navigator.pop(context, false),
          ),
          TextButton(
              child: Text("Evet"),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => anaSayfa(),
                    ));
              }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: AbsorbPointer(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      randomsayibutton("$randomNumbertop"),
                      randomsayibutton("$randomNumbertop2"),
                    ],
                  ),
                ),
              ),
            ),
            ClipRect(
              child: Container(
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: kontrol,
                      child: const Text('gir', style: TextStyle(fontSize: 20)),
                    ),
                    Text("Sadece numara girişi yapabilirsin :) "),
                    TextFormField(
                      controller: degisiklik,
                      autovalidateMode: AutovalidateMode.always,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        // ignore: deprecated_member_use
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  "timer",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextEditingController degisiklik = new TextEditingController();

  void kontrol() {
    int a = randomNumbertop + randomNumbertop2;
    if (a.toString() == degisiklik.text) {
      print("a");
      setState(() {});
    } else {
      print(a);
      print(degisiklik);
      print("b");
    }
  }
}
