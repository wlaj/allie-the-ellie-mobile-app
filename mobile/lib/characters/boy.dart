import 'package:flutter/material.dart';

class MyBoy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      child: Image.asset('lib/images/boy.png',
      fit: BoxFit.cover,)
    );
  }
}