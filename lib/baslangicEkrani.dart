import 'package:deneme/anaSayfa.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class baslangicEkrani extends StatefulWidget {
  @override
  _baslangicEkraniState createState() => _baslangicEkraniState();
}

class _baslangicEkraniState extends State<baslangicEkrani> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => anaSayfa(),
      ));
  });

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Text(
          "MATREMAN",
              style: TextStyle(
            fontSize: 50.0,
                color: Colors.white,
        ),
        ),
      ),
    );
  }
}
