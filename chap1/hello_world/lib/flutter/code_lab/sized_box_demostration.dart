import 'package:flutter/material.dart';
import 'package:hello_world/commons/blue_box.dart';

class SizedBoxDemonstration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      child: Row(
        children: [
          BlueBox(),
          SizedBox(width: 120,),
          BlueBox(),
          SizedBox(
            width: 100.0,
            child: BlueBox(),
          ),
          BlueBox()
        ],
      ),
    );
  }
}
