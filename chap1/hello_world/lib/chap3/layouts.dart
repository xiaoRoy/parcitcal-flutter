
import 'package:flutter/material.dart';

class LayoutShowcase extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final texts = [1, 2, 3].map((number) => Text('Text $number')).toList();
    return MaterialApp(
      title: 'Flutter Layout Playground',
      home: Scaffold(
        body: Center(
          child: Row(
            children: texts,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
