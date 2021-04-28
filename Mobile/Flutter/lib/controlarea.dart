import 'package:flutter/material.dart';

class ControlArea extends StatelessWidget {
  final child;
  final function;
  static bool holdingButton = false;

  ControlArea({this.child, this.function});

  bool userIsHoldingButton() {
    return holdingButton;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        holdingButton = true;
        function();
      },
      onTapUp: (details) {
        holdingButton = false;
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.brown[400],
          child: child,
        ),
      ),
    );
  }
}
