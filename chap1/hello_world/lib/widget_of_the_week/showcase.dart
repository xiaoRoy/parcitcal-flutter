import 'package:flutter/material.dart';
import 'package:hello_world/widget_of_the_week/container_showcase.dart';

class WidgetOfTheWeekShowcase extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('widget of the week')),
      body: ContainerColumn(),
    );
  }
}