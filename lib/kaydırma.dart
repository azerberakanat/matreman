import 'dart:async';

import 'package:deneme/anaSayfa.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class KaydirmaOyunu extends StatefulWidget {
  KaydirmaOyunu({Key key}) : super(key: key);

  createState() => KaydirmaOyunuState();
}

class KaydirmaOyunuState extends State<KaydirmaOyunu> {

  Future<bool> _basgeri() {

    return showDialog(
        context: context,
        builder: (context) => anaSayfa()
    );
  }

  Future<bool> onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("başarıyla tamamladınız Tekrar Oynamak istiyor musunuz"),
        actions: <Widget>[
          TextButton(
            child: Text("Hayır"),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => anaSayfa(),
                  ));
            },
          ),
          TextButton(
            child: Text("Evet"),
            onPressed: () {
              setState(() {
                Navigator.pop(context, false);
                score.clear();
                seed++;
              });
            },
          ),
        ],
      ),
    );
  }

  final Map<String, bool> score = {};
  final Map choices = {
    '🍏': Colors.green,
    '🍋': Colors.yellow,
    '🍅': Colors.red,
    '🍇': Colors.purple,
    '🥥': Colors.brown,
    '🥕': Colors.orange
  };

  int seed = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _basgeri,
      child: Scaffold(
        appBar: AppBar(
            title: Text('Score ${score.length} / 6'),
            backgroundColor: Colors.pink),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              score.clear();
              seed++;
            });
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: choices.keys.map((emoji) {
                    return Draggable<String>(
                      data: emoji,
                      child: Emoji(emoji: score[emoji] == true ? '✅' : emoji),
                      feedback: Emoji(emoji: emoji),
                      childWhenDragging: Emoji(emoji: '🌱'),
                    );
                  }).toList()),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    choices.keys.map((emoji) => _buildDragTarget(emoji)).toList()
                      ..shuffle(Random(seed)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDragTarget(emoji) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String> incoming, List rejected) {
        if (score[emoji] == true) {
          return Container(
            color: Colors.white,
            child: Text('DOĞRUUU!'),
            alignment: Alignment.center,
            height: 50,
            width: 50,
          );
        } else {
          return Container(color: choices[emoji], height: 80, width: 200);
        }
      },
      onWillAccept: (data) => data == emoji,
      onAccept: (data) {
        setState(() {
          score[emoji] = true;
          if (score.length == 6) {
            Timer(Duration(milliseconds: 50), () {
              return onBackPressed();
            });
          }
        });
      },
      onLeave: (data) {},
    );
  }
}

class Emoji extends StatelessWidget {
  Emoji({Key key, this.emoji}) : super(key: key);

  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 80,
        padding: EdgeInsets.all(2),
        child: Text(
          emoji,
          style: TextStyle(color: Colors.black, fontSize: 50),
        ),
      ),
    );
  }
}
