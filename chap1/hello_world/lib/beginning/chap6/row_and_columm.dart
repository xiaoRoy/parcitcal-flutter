import 'package:flutter/material.dart';
import 'package:hello_world/commons/blue_box.dart';

class BeginningBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Beginning'),
        ),
        // body: Row(children: [BlueBoxColumn(4), BlueBoxRow(2)],),
        body: MainAxisShowcase());
  }
}

class MainAxisShowcase extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainAxisShowcaseState();
  }
}

class _MainAxisShowcaseState extends State<MainAxisShowcase> {
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;

  @override
  Widget build(BuildContext context) {
    final ValueChanged<MainAxisAlignment> mainAxisChanged =
        (MainAxisAlignment mainAxisAlignment) {
      setState(() {
        _mainAxisAlignment = mainAxisAlignment;
      });
    };
    return Row(children: [
      Expanded(child: MainAxisRadioGroup(mainAxisChanged, initialMainAxisAlignment: MainAxisAlignment.center,)),
      BlueBoxColumn(
        4,
        mainAxisAlignment: _mainAxisAlignment,
      )
    ]);
  }
}

class BlueBoxColumn extends StatelessWidget {
  final int _count;
  MainAxisAlignment _mainAxisAlignment;

  BlueBoxColumn(this._count,
      {MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start})
      : _mainAxisAlignment = mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    List<BlueBox> blueBoxList = generateBlueBox(_count, margin: 10.0);
    return Column(
      children: blueBoxList,
      mainAxisAlignment: _mainAxisAlignment,
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
  final ValueChanged<MainAxisAlignment> _mainAxisChaned;

  final MainAxisAlignment _initialMainAxisAlignment;

  MainAxisRadioGroup(ValueChanged<MainAxisAlignment> mainAxisChanged,
      {MainAxisAlignment initialMainAxisAlignment = MainAxisAlignment.start})
      : _mainAxisChaned = mainAxisChanged,
        _initialMainAxisAlignment = initialMainAxisAlignment;

  @override
  State<MainAxisRadioGroup> createState() {
    return _MainAxisRadioGroupState(_mainAxisChaned);
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

  MainAxisAlignment? _currentGroupValue;

  final ValueChanged<MainAxisAlignment> _mainAxisChaned;

  _MainAxisRadioGroupState(ValueChanged<MainAxisAlignment> mainAxisChanged,
      {MainAxisAlignment initialMainAxisAlignment = MainAxisAlignment.start})
      : _mainAxisChaned = mainAxisChanged,
        _currentGroupValue = initialMainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final ValueChanged<MainAxisAlignment?> valueChanged =
        (MainAxisAlignment? mainAxisAlignment) {
      setState(() {
        _currentGroupValue = mainAxisAlignment;
        if (mainAxisAlignment != null) {
          _mainAxisChaned(mainAxisAlignment);
        }
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
