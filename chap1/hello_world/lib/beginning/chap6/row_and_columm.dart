import 'package:flutter/material.dart';
import 'package:hello_world/commons/blue_box.dart';

class BeginningBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beginning'),
      ),
      body: BlueBoxRow(5),
    );
  }
}

class BlueBoxColumn extends StatelessWidget {
  final int _count;

  BlueBoxColumn(this._count);

  @override
  Widget build(BuildContext context) {
    List<BlueBox> blueBoxList = generateBlueBox(_count, margin: 10.0);
    return Column(
      children: blueBoxList,
    );
  }
}

List<BlueBox> generateBlueBox(int count, {double margin = 0.0}) {
  List<BlueBox> blueBoxList = [];
  for (var index = 0; index < count; index++) {
    blueBoxList.add(BlueBox(margin: margin));
  }
  return blueBoxList;
}

class BlueBoxRow extends StatelessWidget {

  final int _count;

  BlueBoxRow(this._count);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: generateBlueBox(_count, margin: 5.0),
    );
  }
}
