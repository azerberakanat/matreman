import 'package:deneme/anaSayfa.dart';
import 'package:deneme/dosyaislemi.dart';
import 'package:deneme/grafik.dart';

import 'package:deneme/toplama.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' show radians, Vector3;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'carpma.dart';
import 'cikarma.dart';
import 'kaydırma.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FlutterBase',
        home: Scaffold(body: SizedBox.expand(child: RadialMenu())));
  }
}

class RadialMenu extends StatefulWidget {
  createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 900), vsync: this);
    // ..addListener(() => setState(() {}));
  }

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
      child: RadialAnimation(controller: controller),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class RadialAnimation extends StatelessWidget {
  RadialAnimation({Key key, this.controller})
      : translation = Tween<double>(
          begin: 0.0,
          end: 100.0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.elasticOut),
        ),
        scale = Tween<double>(
          begin: 1.5,
          end: 0.0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
        ),
        rotation = Tween<double>(
          begin: 0.0,
          end: 360.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              0.7,
              curve: Curves.decelerate,
            ),
          ),
        ),
        super(key: key);

  final AnimationController controller;
  final Animation<double> rotation;
  final Animation<double> translation;
  final Animation<double> scale;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, widget) {
          return Transform.rotate(
              angle: radians(rotation.value),
              child: Stack(alignment: Alignment.center, children: <Widget>[
                _buildButton(context, 0, 3,
                    color: Colors.red, icon: FontAwesomeIcons.accessibleIcon),
                _buildButton(context, 45, 4,
                    color: Colors.green, icon: FontAwesomeIcons.apple),
                _buildButton(context, 90, 5,
                    color: Colors.orange, icon: FontAwesomeIcons.ad),
                _buildButton(context, 135, 6,
                    color: Colors.blue, icon: FontAwesomeIcons.check),
                _buildButton(context, 180, 7,
                    color: Colors.black, icon: FontAwesomeIcons.chair),
                _buildButton(context, 225, 0,
                    color: Colors.indigo, icon: FontAwesomeIcons.home),
                _buildButton(context, 270, 1,
                    color: Colors.pink, icon: FontAwesomeIcons.balanceScaleRight),
                _buildButton(context, 315, 2,
                    color: Colors.yellow, icon: FontAwesomeIcons.waveSquare),
                Transform.scale(
                  scale: scale.value - 1,
                  child: FloatingActionButton(
                      child: Icon(FontAwesomeIcons.timesCircle),
                      onPressed: _close,
                      backgroundColor: Colors.red),
                ),
                Transform.scale(
                  scale: scale.value,
                  child: FloatingActionButton(
                      child: Icon(FontAwesomeIcons.solidDotCircle),
                      onPressed: _open),
                )
              ]));
        });
  }

  _open() {
    controller.forward();
  }

  _close() {
    controller.reverse();
  }

  _buildButton(BuildContext context, double angle, int index,
      {Color color, IconData icon}) {
    final double rad = radians(angle);
    return Transform(
      transform: Matrix4.identity()
        ..translate(
            (translation.value) * cos(rad), (translation.value) * sin(rad)),
      child: FloatingActionButton(
          child: Icon(icon),
          backgroundColor: color,
          onPressed: () {
            if (index == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => anaSayfa(),
                ),
              );
            }
          },
          elevation: 0),
    );
  }
}
