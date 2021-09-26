import 'package:flutter/material.dart';

class SplashButton extends StatelessWidget {
  final String text;
  final Color textColor, backgroundColor, splashColor;
  final VoidCallback onPressed;

  SplashButton(
      {Key? key,
      required this.text,
      required this.textColor,
      required this.backgroundColor,
      required this.splashColor,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: backgroundColor,
      splashColor: splashColor,
      padding: ButtonTheme.of(context).padding,
      child: Text(
        this.text,
        style: TextStyle(color: this.textColor),
      ),
      shape: StadiumBorder(),
    );
  }
}
