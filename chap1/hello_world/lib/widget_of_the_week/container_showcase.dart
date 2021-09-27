import 'package:flutter/material.dart';

// “The Container and the BoxDecoration”

class NormalContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.all(20.0),
      width: 200.0,
      height: 100.0,
      child: Text(
        'Prova',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

//BoxDecoration

class ContainerWithBoxDecoration extends StatelessWidget {
  final String _text;
  final Color _textColor;

  ContainerWithBoxDecoration(
      {required String text, Color textColor = Colors.yellowAccent})
      : _text = text,
        _textColor = textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 300.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
      ),
      child: Center(
        child: Text(
          _text,
          style: TextStyle(color: _textColor, fontSize: 30),
        ),
      ),
    );
  }
}

class ContainerColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ContainerWithBoxDecoration(text: 'Smile Again!'),
        ContainerWithBoxDecoration(
            text: 'How Are you?', textColor: Colors.teal),
      ],
    );
  }
}

// useing method is not recommended
Column buildCircleContainers() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      ContainerWithBoxDecoration(text: 'Smile Again!'),
      ContainerWithBoxDecoration(text: 'How Are you?', textColor: Colors.teal),
    ],
  );
}
