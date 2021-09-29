
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_world/prgramming_flutter/chap_2/images.dart';

class ProgrammingFlutterChap2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Programming Flutter Chapter 2'),),
      body: ImageContainer(ImageContainer.TEST_URL),
    );
  }
}