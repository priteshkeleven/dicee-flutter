import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:vibration/vibration.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Dicee",
          ),
          backgroundColor: Colors.indigo,
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int topDiceNumber = 3;
  int btmDiceNumber = 3;

  void changeDiceNumbers() {
    Vibration.vibrate();
    setState(() {
      topDiceNumber = Random().nextInt(6) + 1;
      btmDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      changeDiceNumbers();
      print("Phone shook!!!");
    });
  }

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 50, 40, 25),
              child: FlatButton(
                onPressed: () {
                  changeDiceNumbers();
                },
                padding: EdgeInsets.zero,
                child: Image.asset('images/dice$topDiceNumber.png'),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 25, 40, 50),
              child: FlatButton(
                onPressed: () {
                  changeDiceNumbers();
                },
                padding: EdgeInsets.zero,
                child: Image.asset('images/dice$btmDiceNumber.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
