import 'package:flutter/material.dart';

class SafariZone extends StatelessWidget {
  double x;
  double y;
  String currentMap;

  SafariZone({this.x, this.y, this.currentMap});

  @override
  Widget build(BuildContext context) {
    if (currentMap == 'safarizone') {
      return Container(
        alignment: Alignment(x, y),
        child: Image.asset(
          'lib/images/littleroot.png',
          width: MediaQuery.of(context).size.width * 
          1.0,
          fit: BoxFit.fill,
        ),
      );
    } else {
    return Container();
    }
  }
}