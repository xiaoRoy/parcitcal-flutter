import 'dart:math';

import 'package:flutter/material.dart';

class HelloRectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.greenAccent,
        width: 400.0,
        height: 500.0,
        child: const Center(
          child: Text(
            'Hello!',
            style: TextStyle(fontSize: 40.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class MutableHelloRectangle extends StatefulWidget {
  final String text;

  MutableHelloRectangle({required this.text});

  @override
  State<StatefulWidget> createState() {
    return _MutableHelloRectangleState();
  }
}

class _MutableHelloRectangleState extends State<MutableHelloRectangle> {
  Color _backgroundColor = Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          setState(() {
            final random = Random(DateTime.now().millisecond);
            final color = Color.fromARGB(255, random.nextInt(256), random.nextInt(256), random.nextInt(256));
            _backgroundColor = color;
          });
        },
        child: Text(widget.text),
        style: TextButton.styleFrom(backgroundColor: _backgroundColor),
      ),
    );
  }
}
