import 'package:allie_the_ellie_open_world/button.dart';
import 'package:allie_the_ellie_open_world/characters/boy.dart';
import 'package:allie_the_ellie_open_world/maps/safarizone.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double mapX = 0;
  double mapY = 0;
  double characterX = 0;
  double characterY = 0;

  String currentLocation = 'safarizone';

  void moveUp() {
    setState(() {
      mapY += 0.2;
    });
  }

  void moveDown() {}

  void moveRight() {}

  void moveLeft() {}

  void pressedA() {}

  void pressedB() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.14 ,
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/images/littleroot.png"),
                  ),
                ),
                child: Stack(
                  children: [
                    // Safari zone
                    SafariZone(
                      x: mapX,
                      y: mapY,
                      currentMap: currentLocation,
                    ),
                    Container(
                      alignment: Alignment(0, 0),
                      child: MyBoy(),
                    )
                  ],
                )),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[800],
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Allie the Ellie test',
                        style: TextStyle(color: Colors.white)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                                MyButton(
                                  text: '←',
                                  function: moveLeft,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                MyButton(
                                  text: '↑',
                                  function: moveUp,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                                MyButton(
                                  text: '↓',
                                  function: moveDown,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                                MyButton(
                                  text: '→',
                                  function: moveRight,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                              ],
                            ),
                          ],
                        ),
                        MyButton(
                          text: 'a',
                          function: pressedA,
                        ),
                        MyButton(
                          text: 'b',
                          function: pressedB,
                        ),
                      ],
                    ),
                    Text(
                      'Gemaakt door Evolve',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
