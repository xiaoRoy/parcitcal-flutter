import 'package:flutter/material.dart';

class BlueBox extends StatelessWidget {
  final double _margin;

  BlueBox({double margin = 0.0}) : _margin = margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.all(_margin),
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
      ),
    );
  }
}
