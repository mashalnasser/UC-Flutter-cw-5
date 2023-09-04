import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int number1 = 1;
  int number2 = 1;
  String result = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "imgeas/i_$number1.png",
                        width: 150,
                      ),
                      Text("Player 1")
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "imgeas/i_$number2.png",
                        width: 150,
                      ),
                      Text("Player 2")
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 40,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    number1 = Random().nextInt(3) + 1;
                    number2 = Random().nextInt(3) + 1;
                    determineWinner();
                  });
                },
                child: Text("Play"),
              ),
              Text(
                result,
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void determineWinner() {
    if (number1 == number2) {
      setState(() {
        result = 'Drwe';
      });
    } else if ((number1 == 1 && number2 == 3) ||
        (number1 == 2 && number2 == 1) ||
        (number1 == 3 && number2 == 2)) {
      setState(() {
        result = 'Player 1 Win';
      });
    } else {
      setState(() {
        result = 'Player 2 Win';
      });
    }
  }
}
