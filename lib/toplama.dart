import 'package:deneme/anaSayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class topsayfa extends StatefulWidget {
  @override
  _topsayfaState createState() => _topsayfaState();
}

int girilenrakam;
final emailController = TextEditingController();

bool kontrol() {
  int a = randomNumber + randomNumber2;
}

Random random = new Random();
int randomNumber = random.nextInt(100);

Random random2 = new Random();
int randomNumber2 = random2.nextInt(100);

class _topsayfaState extends State<topsayfa> {
  List<String> rakamlar = [
    "$randomNumber",
    "$randomNumber2",
  ];

  Widget randomsayibutton(String rakamlar) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => topsayfa,
        child: Text(
          rakamlar,
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
          FlatButton(
            child: Text("Hayır"),
            onPressed: () => Navigator.pop(context, false),
          ),
          FlatButton(
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
                      randomsayibutton("$randomNumber"),
                      randomsayibutton("$randomNumber2"),
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

  Widget buildEmail() => TextField(
        controller: emailController,
        decoration: InputDecoration(
          hintText: 'name@example.com',
          labelText: 'Email',
          prefixIcon: Icon(Icons.mail),
          // icon: Icon(Icons.mail),
          suffixIcon: emailController.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => emailController.clear(),
                ),
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        // autofocus: true,
      );
}
