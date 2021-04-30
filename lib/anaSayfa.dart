import 'package:deneme/hakk%C4%B1nda.dart';
import 'package:deneme/profil.dart';
import 'package:deneme/skor.dart';
import 'package:flutter/services.dart';
import 'package:deneme/carpma.dart';
import 'package:deneme/cikarma.dart';
import 'package:deneme/toplama.dart';
import 'package:flutter/material.dart';
import 'package:navigating_drawer/navigating_drawer.dart';


class anaSayfa extends StatefulWidget {
  @override
  _anaSayfaState createState() => _anaSayfaState();
}

class _anaSayfaState extends State<anaSayfa> {
  List<String> resimler = [
    "images/Top.png",
    "images/cik.png",
    "images/carp.png",
  ];

  Widget customcard1(String islemadi, String resimler) {
    return Padding(
        padding: EdgeInsets.all(
          5.0,
        ),
        child: IconButton(
          icon: Image.asset(resimler),
          iconSize: 250,
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => topsayfa(),
                ));
          },
        ));
  }

  Widget customcard2(String islemadi, String resimler) {
    return Padding(
        padding: EdgeInsets.all(
          5.0,
        ),
        child: IconButton(
          icon: Image.asset(resimler),
          iconSize: 250,
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => cikarmasayfa(),
                ));
          },
        ));
  }

  Widget customcard3(String islemadi, String resimler) {
    return Padding(
        padding: EdgeInsets.all(
          5.0,
        ),
        child: IconButton(
          icon: Image.asset(resimler),
          iconSize: 250,
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => carpmasayfa(),
                ));
          },
        ));
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context)=>
        AlertDialog(
          title: Text("Uygulamadan Çıkmak istiyor musunuz?"),
          actions: <Widget>[
            FlatButton(
              child: Text("Hayır"),
              onPressed: () => Navigator.pop(context, false),
            ),
            FlatButton(
              child: Text("Evet"),
              onPressed: () => Navigator.pop(context, true),
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
        drawer: NavigatingDrawer(
          body: Center(
            child: NavigatingDrawerList(
              children: [
                NavigatingDrawerListItem(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => profilsayfa(),
                        ));
                  },
                  title: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      child: Text(
                        'Profil',
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                NavigatingDrawerListItem(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => skorsayfa(),
                        ));
                  },
                  title: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      child: Text('Son Oyunlarım',
                          style: TextStyle(
                            fontSize: 24.0,
                          )),
                    ),
                  ),
                ),
                NavigatingDrawerListItem(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => hakkindasayfa(),
                        ));
                  },
                  title: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                        child: Text(
                          'Hakkında',
                          style: TextStyle(
                            fontSize: 24.0,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Text(
            "MATREMAN",
          ),
        ),
        body: ListView(
          children: <Widget>[
            customcard1("toplama", resimler[0]),
            customcard2("cikarma", resimler[1]),
            customcard3("carpma", resimler[2]),
          ],
        ),
      ),
    );
  }
}
