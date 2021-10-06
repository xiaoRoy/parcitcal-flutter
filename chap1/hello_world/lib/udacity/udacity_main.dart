import 'package:flutter/material.dart';
import 'package:hello_world/udacity/category.dart';
import 'package:hello_world/udacity/hello_rectangle.dart';

class UnitCoverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Unit Converter', style: TextStyle(fontSize: 30.0),),
      ),
      body: MutableHelloRectangle(text: 'Random Color'),
    );
  }
}
