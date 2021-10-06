import 'package:flutter/material.dart';
import 'package:hello_world/flutter/navigation/navigation_animation.dart';

class NavigationMain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Navigation'),),
      body: FirstScreen(),
    );
  }
}