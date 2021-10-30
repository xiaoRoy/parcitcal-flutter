//Basic Flutter layout concepts

import 'package:flutter/material.dart';
import 'package:hello_world/commons/blue_box.dart';

//main axis size

class MainAxisSizeShowcase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _BlueBoxColumnWithBackground(
          mainAxisSize: MainAxisSize.max,
        ),
        _BlueBoxColumnWithBackground(
          mainAxisSize: MainAxisSize.min,
        )
      ],
    );
  }
}

class _BlueBoxColumnWithBackground extends StatelessWidget {
  final MainAxisSize _mainAxisSize;

  _BlueBoxColumnWithBackground({MainAxisSize mainAxisSize = MainAxisSize.max})
      : _mainAxisSize = mainAxisSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Column(
        mainAxisSize: _mainAxisSize,
        children: _generateBlueBoxes(4),
      ),
    );
  }

  List<BlueBox> _generateBlueBoxes(int count) {
    List<BlueBox> blueBoxList = [];
    for (var index = 0; index < count; index++) {
      blueBoxList.add(BlueBox(
        margin: 8.0,
      ));
    }
    return blueBoxList;
  }
}

class FlexibleFitPropertyDemonstration extends StatelessWidget {

  Container _generateRowContainer(FlexFit flexFit) {
    return Container(
          margin: EdgeInsets.all(6.0),
          child: Row(children: [
            BlueBox(),
            Flexible(child: BlueBox(), flex: 1, fit: flexFit),
            Flexible(child: BlueBox(), flex: 1, fit: flexFit)
          ]),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[_generateRowContainer(FlexFit.loose), _generateRowContainer(FlexFit.tight)],
    );
  }
}
