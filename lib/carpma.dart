import 'package:deneme/randomlar.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';

import 'anaSayfa.dart';

class carpmasayfa extends StatefulWidget {
  @override
  _carpmasayfaState createState() => _carpmasayfaState();

}
Random random = new Random();
int randomNumbercarp = random.nextInt(10)+1;
Random random2 = new Random();
int randomNumbercarp2 = random2.nextInt(10)+1;

class _carpmasayfaState extends State<carpmasayfa> {



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
        builder: (context) => anaSayfa()
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
                      randomsayibutton("$randomNumbercarp"),
                      randomsayibutton("$randomNumbercarp2"),
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
                    Text("Sadece numara giri??i yapabilirsin :) "),
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



  void kontrol()
  {
    int a = randomNumbercarp*randomNumbercarp2;
    if (a.toString()==degisiklik.text)
    {
      print("a");
        setState(() {});


    }
    else{
      print(a);
      print(degisiklik);
      print("b");

    }

  }
}


