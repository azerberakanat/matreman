import 'package:deneme/anaSayfa.dart';
import 'package:flutter/material.dart';
import 'package:navigating_drawer/navigating_drawer.dart';
import 'package:flutter/services.dart';

class skorsayfa extends StatefulWidget {
  @override
  _skorsayfaState createState() => _skorsayfaState();
}

class _skorsayfaState extends State<skorsayfa> {
  Future<bool> _onBackPressed() {

    return showDialog(
        context: context,
        builder: (context) => anaSayfa()
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Center(
          child: Text(
            "skor",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        appBar: AppBar(
          title: Text("Skorlarım"),
        ),
      ),
    );
  }
}
