import 'dart:ui';

import 'package:flutter/material.dart';

class SizedBoxDocumentation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildColumnToShowChildrenConstraints();
  }

  Widget _budldFlexibleColumn() {
    return Column(
      children: [
        Flexible(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Container(
              color: Colors.blueGrey,
            ),
          ),
        ),
        Container(
          color: Colors.limeAccent,
          height: 200,
        ),
      ],
    );
  }

  Widget _buildEmptyColumn() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity, // why??
          child: Container(
            color: Colors.blueGrey,
          ),
        ),
        Container(
          color: Colors.limeAccent,
          height: 200,
        )
      ],
    );
  }

  Widget _buildColumnToShowChildrenConstraints() {
    return Column(
      children: [
        _buildUsingLayoutBuilder(() {
          return Text('I get a unbound constraint from parent.');
        }),
      ],
    );
  }

  //BoxConstraints forces an infinite height.
  Widget _buildColumnWithInfiniteChild() {
    return _buildUsingLayoutBuilder(() {
      return Column(
        children: [
          Container(
            color: Colors.cyan,
            height: double.infinity,
            width: 300,
          ),
        ],
      );
    });
  }

  Widget _buildColumnToShowSize() {
    return _buildUsingLayoutBuilder(() {
      return Container(
        height: 600,
        width: double.infinity,
        color: Colors.black38,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 124,
              height: 240,
              color: Colors.greenAccent,
            ),
          ],
        ),
      );
    });
  }

  // Widget _buildColumnGivenUnboundConstraint() {
  //   return
  // }

  Widget _buildUsingLayoutBuilder(Widget Function() buildWidget) {
    return LayoutBuilder(
        builder: (BuildContext buildContext, BoxConstraints boxConstraints) {
      print('box constraints:${boxConstraints.toString()}');
      return buildWidget();
    });
  }
}
