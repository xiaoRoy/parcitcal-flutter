import 'package:flutter/material.dart';

class SizedBoxDocumentation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildColumnWithInfiniteChild();
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

  //BoxConstraints forces an infinite height.
  Widget _buildColumnWithInfiniteChild() {
    return Column(children: [
      Container(
        color: Colors.cyan,
        height: double.infinity,
        width: 300,
      ),
    ],);
  }
}
