import 'package:flutter/material.dart';
import 'package:hello_world/commons/layout_builder.dart';

class ConstrainedBoxDemonstration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      child: Text('Constrained Box'),
    );
  }
}

class MiniHeightExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCuttingIcon(),
        const SizedBox(
          height: 120,
        ),
        _buildCuttingIconSecond(),
        const SizedBox(
          height: 120,
        ),
        _buildNormalIcon(),
        const SizedBox(
          height: 120,
        ),
        _buildNormalIconContainerInside(),
      ],
    );
  }

  Widget _buildCuttingIcon() {
    return Row(
      children: [
        Container(
          height: 50,
          color: Colors.greenAccent,
          child: buildUsingLayoutBuilder(() {
            return Icon(
              Icons.add,
              size: 80,
              color: Colors.red,
            );
          }),
        ),
        Container(
          margin: EdgeInsets.all(32),
          child: Text('It\'s cutting the child view'),
        ),
      ],
    );
  }

   Widget _buildNormalIcon() {
    return Row(
      children: [
        Container(
          color: Colors.greenAccent,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: 50.0),
            child: buildUsingLayoutBuilder(() {
              return Icon(
                Icons.add,
                size: 80,
                color: Colors.red,
              );
            }),
          ),
        ),
        Container(
          margin: EdgeInsets.all(32),
          child: Text('It\'s cutting the child view'),
        ),
      ],
    );
  }

  Widget _buildCuttingIconSecond() {
    return Row(
      children: [
        Container(
          height: 50,
          color: Colors.greenAccent,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: 50.0),
            child: buildUsingLayoutBuilder(() {
              return Icon(
                Icons.add,
                size: 80,
                color: Colors.red,
              );
            }),
          ),
        ),
        Container(
          margin: EdgeInsets.all(32),
          child: Text('The icon displays normally.'),
        ),
      ],
    );
  }

  Widget _buildNormalIconContainerInside() {
    return Row(
      children: [
         ConstrainedBox(
            constraints: BoxConstraints(minHeight: 50.0),
            child: buildUsingLayoutBuilder(() {
              return Container(
                color: Colors.greenAccent,
                child: Icon(
                  Icons.add,
                  size: 80,
                  color: Colors.red,
                ),
              );
            }),
          ),
        Container(
          margin: EdgeInsets.all(32),
          child: Text('The icon displays normally.'),
        ),
      ],
    );
  }
}
