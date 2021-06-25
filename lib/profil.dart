import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'anaSayfa.dart';

class profilsayfa extends StatefulWidget {
  @override
  _profilsayfaState createState() => _profilsayfaState();
}

class _profilsayfaState extends State<profilsayfa> {
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("anasayfaya dönmek istiyor musunuz?"),
        actions: <Widget>[
          TextButton(
            child: Text("Hayır"),
            onPressed: () => Navigator.pop(context, false),
          ),
          TextButton(
            child: Text("Evet"),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => anaSayfa()),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Center(
          child: Text(
            "Profilim",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        appBar: AppBar(
          title: Text("profil"),
        ),
      ),
    );
  }
}
