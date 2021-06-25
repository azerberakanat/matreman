import 'package:deneme/hakk%C4%B1nda.dart';
import 'package:deneme/profil.dart';
import 'package:deneme/skor.dart';
import 'package:flutter/services.dart';
import 'package:deneme/carpma.dart';
import 'package:deneme/cikarma.dart';
import 'package:deneme/toplama.dart';
import 'package:flutter/material.dart';
import 'package:navigating_drawer/navigating_drawer.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

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

  int index = 0;

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
      builder: (context) => AlertDialog(
        title: Text("Uygulamadan Çıkmak istiyor musunuz?"),
        actions: <Widget>[
          TextButton(
            child: Text("Hayır"),
            onPressed: () => Navigator.pop(context, false),
          ),
          TextButton(
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
        backgroundColor: Colors.deepOrange,
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
        body: buildPages(),
        bottomNavigationBar: buildBottomNavigation(),

        /* CurvedNavigationBar(
            color: Colors.black,
            backgroundColor: Colors.blueGrey,
            buttonBackgroundColor: Colors.grey,
            items: <Widget>[
              Icon(Icons.pause_rounded, size: 20, color: Colors.white),
              Icon(Icons.add, size: 20, color: Colors.white),
              Icon(Icons.add_a_photo_rounded, size: 20, color: Colors.white),
              Icon(Icons.equalizer, size: 20, color: Colors.white),
              Icon(Icons.delete, size: 20, color: Colors.white),
            ],
            onTap: (index) {
              switch (index) {
                case 1:
              }
            }
            ),*/
      ),
    );
  }

  Widget buildBottomNavigation() {
    return BottomNavyBar(
      backgroundColor: Colors.black,
      containerHeight: 80,
      selectedIndex: index,
      onItemSelected: (index) => setState(() => this.index = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text('home'),
          activeColor: Colors.blueAccent,
          inactiveColor: Colors.grey,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.one_x_mobiledata),
          title: Text('Çarpma'),
          activeColor: Colors.blueGrey,
          inactiveColor: Colors.grey,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.add),
          title: Text('Toplama'),
          activeColor: Colors.deepOrange,
          inactiveColor: Colors.grey,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.exposure_minus_1),
          title: Text('çıkarma'),
          activeColor: Colors.amber,
          inactiveColor: Colors.grey,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.verified_user),
          title: Text('Profilim'),
          activeColor: Colors.amber,
          inactiveColor: Colors.grey,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget buildPages() {
    switch (index) {
      case 1:
        return carpmasayfa();
      case 2:
        return topsayfa();
      case 3:
        return cikarmasayfa();
      case 4:
        return profilsayfa();
      case 0:
      default:
        return temel();
    }
  }

  Widget temel() {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
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

      body: ListView(
        children: <Widget>[
          customcard1("toplama", resimler[0]),
          customcard2("cikarma", resimler[1]),
          customcard3("carpma", resimler[2]),
        ],
      ),


    );
  }
}
