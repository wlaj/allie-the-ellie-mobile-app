import 'dart:math';

import 'package:flutter/material.dart';

class MyEgel extends StatelessWidget {
  final int sidekickSpriteCount; // between 1~22
  final String sidekickDirection;
  

  MyEgel({this.sidekickSpriteCount, this.sidekickDirection});

  @override
  Widget build(BuildContext context) {
    if (sidekickDirection == 'right') {
      return Container(
        alignment: Alignment.bottomCenter,
        height: 50,
        width: 50,
        
        // + teddySpriteCount.toString()
        child: Image.asset('lib/images/egel1' +
            '.png'),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 50,
          width: 50,
          // + teddySpriteCount.toString()
          child: Image.asset('lib/images/egel1' +
              '.png'),
        ),
      );
    }
  }
}
