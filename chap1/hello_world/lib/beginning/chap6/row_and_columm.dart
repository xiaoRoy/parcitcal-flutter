import 'package:flutter/material.dart';
import 'package:hello_world/commons/blue_box.dart';

class BeginningBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beginning'),
      ),
      body: MainAxisRadioGroup(),
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

class MainAxisRadioGroup extends StatefulWidget {
  @override
  State<MainAxisRadioGroup> createState() {
    return _MainAxisRadioGroupState();
  }
}

class _MainAxisRadioGroupState extends State<MainAxisRadioGroup> {
  static const _mainAxisList = [
    MainAxisAlignment.center,
    MainAxisAlignment.end,
    MainAxisAlignment.spaceAround,
    MainAxisAlignment.spaceBetween,
    MainAxisAlignment.spaceEvenly,
    MainAxisAlignment.start,
  ];

  MainAxisAlignment? _currentGroupValue = _mainAxisList.first;

  @override
  Widget build(BuildContext context) {
    final ValueChanged<MainAxisAlignment?> valueChanged =
        (MainAxisAlignment? mainAxisAlignment) {
      setState(() {
        _currentGroupValue = mainAxisAlignment;
      });
    };

    final mainAxisRadioItemList = _mainAxisList.map((mainAxisAligment) {
      final mainAxisAligmentValue = mainAxisAligment.toString();
      return ListTile(
        title: Text(mainAxisAligmentValue),
        leading: Radio<MainAxisAlignment>(
          value: mainAxisAligment,
          groupValue: _currentGroupValue,
          onChanged: valueChanged,
        ),
      );
    }).toList();

    return Column(
      children: mainAxisRadioItemList,
    );
  }
}