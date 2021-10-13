

import 'package:flutter/material.dart';
import 'package:hello_world/udacity/unit_commons.dart';

import 'category.dart';

class MutableUnitConverter extends StatefulWidget {
  final UnitCategorySpec _unitCategorySpec;

  MutableUnitConverter({
    required UnitCategorySpec unitCategorySpec,
  }) : _unitCategorySpec = unitCategorySpec;


  @override
  State<StatefulWidget> createState() {
    return _MutableUnitConverterState();
  }
}

class _MutableUnitConverterState extends State<MutableUnitConverter> {

  @override
  Widget build(BuildContext context) {
    return buildUnitConverter(context, widget._unitCategorySpec);
  }
}