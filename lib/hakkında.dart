import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'anaSayfa.dart';

class hakkindasayfa extends StatefulWidget {
  @override
  _hakkindasayfaState createState() => _hakkindasayfaState();
}

class _hakkindasayfaState extends State<hakkindasayfa> {
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
            "Bu uygulama Dr. Öğretim üyesi Ahmet Cevahir ÇINAR tarafından /n"
                " Yürütülen 3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında/n"
                " 193301068 numaralı Öğrenci Tarafından 30 nisan 2021 günü yapılmıştır.",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        appBar: AppBar(
          title: Text("Hakkında"),
        ),
      ),
    );
  }
}
