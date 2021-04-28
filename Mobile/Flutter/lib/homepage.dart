import 'dart:async';
import 'package:allie_the_ellie_the_game/controlarea.dart';
import 'package:allie_the_ellie_the_game/prop.dart';
import 'package:flutter/material.dart';

import 'allie.dart';
import 'sidekick.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double allieX = 0;
  static double allieY = 1;
  double allieSize = 100;
  double propX = 0.5;
  double propY = 1.1;
  double time = 0;
  double height = 0;
  double initialHeight = allieY;
  String direction = "right";
  bool midrun = false;
  bool midjump = false;

  // Loading Screen
  var loadingScreenColor = Colors.orange[100];
  var loadingScreenTextColor = Colors.orange[400];
  var tapToPlayColor = Colors.white;
  int loadingTime = 3;
  bool gameHasStarted = false;

  // TEDDY BEAR
  int sidekickSpriteCount = 1; // initally, teddy1.png
  double sidekickPosX = 0;
  String sidekickDirection = 'right';

  void playNow() {
    startGameTimer();
    moveSidekick();
  }

  void startGameTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        loadingTime--;
      });
      if (loadingTime == 0) {
        print('Game starts');
        setState(() {
          loadingScreenColor = Colors.black12;
          loadingTime = 3;
          loadingScreenTextColor = Colors.transparent;
        });
        timer.cancel();
      }
    });
  }

  void checkIfHitProp() {
    if ((allieX - propX).abs() < 0.12 && (allieY - propY).abs() < 0.12) {
      print('Allie interacts');
      setState(() {
        // move prop off screen
        propX = 2;
        allieSize = 200;
      });
    }
  }

  void preJump() {
    time = 0;
    initialHeight = allieY;
  }

  void smile() {
    time = 0;
    initialHeight = allieY;
  }

  void jump() {
    // disable double jump
    if (midjump == false) {
      print('Allie jumps');
      midjump = true;
      preJump();
      Timer.periodic(Duration(milliseconds: 50), (timer) {
        time += 0.05;
        height = -4.9 * time * time + 5 * time;

        if (initialHeight - height > 1) {
          midjump = false;
          setState(() {
            allieY = 1;
          });
          timer.cancel();
        } else {
          setState(() {
            allieY = initialHeight - height;
          });
        }
      });
    }
  }

  void moveSidekick() {
    Timer.periodic(Duration(milliseconds: 80), (timer) {
      setState(() {
        sidekickSpriteCount++;

        if (sidekickSpriteCount == 23) {
          sidekickSpriteCount = 1;
        }

        if ((sidekickPosX - allieX).abs() > 0.2) {
          if (direction == 'right') {
            sidekickPosX = allieX - 0.2;
          } else if (direction == 'left') {
            sidekickPosX = allieX + 0.2;
          }
        }

        if (sidekickPosX - allieX > 0) {
          sidekickDirection = 'left';
        } else {
          sidekickDirection = 'right';
        }
      });
    });
  }

  void moveRight() {
    direction = "right";
    checkIfHitProp();
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (ControlArea().userIsHoldingButton() == true && (allieX + 0.02) < 1) {
        setState(() {
          allieX += 0.02;
          midrun = !midrun;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void moveLeft() {
    direction = "left";
    checkIfHitProp();
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (ControlArea().userIsHoldingButton() == true && (allieX - 0.02) > -1) {
        setState(() {
          allieX -= 0.02;
          midrun = !midrun;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: GestureDetector(
                  onTap: () {
                    if (gameHasStarted == false) {
                      playNow();
                      tapToPlayColor = Colors.transparent;
                      gameHasStarted = true;
                    }
                  },
                  child: Stack(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("lib/images/Cactus.png"),
                            ),
                          ),
                          child: AnimatedContainer(
                            alignment: Alignment(allieX, allieY),
                            duration: Duration(milliseconds: 0),
                            child: midjump
                                ? JumpingAllie(
                                    direction: direction,
                                    size: allieSize,
                                  )
                                : MyAllie(
                                    direction: direction,
                                    midrun: midrun,
                                    size: allieSize,
                                  ),
                          )),
                      Container(
                        color: loadingScreenColor,
                        child: Center(
                          child: Text(loadingTime.toString(),
                              style: TextStyle(
                                  color: loadingScreenTextColor, fontSize: 70)),
                        ),
                      ),
                      Container(
                        alignment: Alignment(sidekickPosX, 1),
                        child: MyEgel(
                          sidekickDirection: sidekickDirection,
                          sidekickSpriteCount: sidekickSpriteCount,
                        ),
                      ),
                      Container(
                        alignment: Alignment(0, 0.4),
                        child: Text('LETSS GOOOO YEAH YEAH',
                            style: TextStyle(
                                color: loadingScreenTextColor, fontSize: 30)),
                      ),
                      Container(
                        alignment: Alignment(propX, propY),
                        child: MyProp(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(''),
                              Text(''),
                            ],
                          ),
                          Column(
                            children: [
                              Text(''),
                              Text(''),
                            ],
                          ),
                          Column(
                            children: [
                              Text(''),
                              Text(''),
                            ],
                          ),
                        ],
                      )
                    ],
                  ))),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.brown[500],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ControlArea(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      function: moveLeft,
                    ),
                    ControlArea(
                      child: Icon(
                        Icons.arrow_upward,
                        color: Colors.white,
                      ),
                      function: jump,
                    ),
                    ControlArea(
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      function: moveRight,
                    ),
                    ControlArea(
                      child: Icon(
                        Icons.attractions,
                        color: Colors.white,
                      ),
                    ),
                    ControlArea(
                      child: Icon(
                        Icons.arrow_downward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
