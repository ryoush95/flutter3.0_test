import 'dart:math';

import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int dice1 = 0;
  int dice2 = 0;

  void random() {


    setState(() {
      dice1 = Random().nextInt(6)+1;
      dice2 = Random().nextInt(6)+1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(dice1.toString()),
                Text(dice2.toString()),
              ],
            ),
            ElevatedButton(onPressed: (){
              random();
            }, child: Text('굴리기'),
            onLongPress: (){
              setState((){
                dice1 = 6;
                dice2 = 6;
              });
            },)
          ],
        ),
      ),
    );
  }
}
