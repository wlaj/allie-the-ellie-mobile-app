import 'dart:math';

import 'package:flutter/material.dart';

class MyAllie extends StatelessWidget {
  final direction;
  final midrun;
  final size;

  MyAllie({this.direction, this.midrun, this.size});

  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return Container(
        width: size,
        height: size,
        child: midrun
            ? Image.asset('lib/images/Allie_the_Ellie_right_standing.png')
            : Image.asset('lib/images/Allie_the_Ellie_right_standing.png'),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
            width: size,
            height: size,
            child: midrun
                ? Image.asset('lib/images/Allie_the_Ellie_right_standing.png')
                : Image.asset('lib/images/Allie_the_Ellie_right_standing.png')),
      );
    }
  }
}

class JumpingAllie extends StatelessWidget {
  final direction;
  final size;

  JumpingAllie({this.direction, this.size});

  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return Container(
          width: size,
          height: size,
          child: Image.asset('lib/images/Allie_the_Ellie_right_standing.png'));
          
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
            width: size,
            height: size,
            child: Image.asset('lib/images/Allie_the_Ellie_right_standing.png')),
      );
    }
  }
}

class SmileAllie extends StatelessWidget {
  final direction;
  final size;

  SmileAllie({this.direction, this.size});

  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return Container(
          width: size,
          height: size,
          child: Image.asset('lib/images/cactus.png'));
          
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
            width: size,
            height: size,
            child: Image.asset('lib/images/cactus.png')),
      );
    }
  }
}




