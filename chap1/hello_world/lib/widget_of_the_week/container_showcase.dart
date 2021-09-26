import 'package:flutter/material.dart';

// “The Container and the BoxDecoration”

class NormalContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.all(20.0),
      width: 200.0,
      height: 100.0,
      child: Text(
        'Prova',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
