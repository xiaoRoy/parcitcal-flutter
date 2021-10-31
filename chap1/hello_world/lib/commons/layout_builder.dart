
import 'package:flutter/material.dart';

Widget buildUsingLayoutBuilder(Widget Function() buildWidget) {
    return LayoutBuilder(
        builder: (BuildContext buildContext, BoxConstraints boxConstraints) {
      print('box constraints:${boxConstraints.toString()}');
      return buildWidget();
    });
  }