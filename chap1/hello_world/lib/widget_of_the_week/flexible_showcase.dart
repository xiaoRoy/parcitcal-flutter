import 'package:flutter/material.dart';

class FlexibleShowcase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(flex: 2, child: Container(color: Colors.cyan)),
        Flexible(flex: 3, child: Container(color: Colors.teal)),
        Flexible(flex: 1, child: Container(color: Colors.indigo))
      ],
    );
  }
}
