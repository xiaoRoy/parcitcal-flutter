

import 'package:flutter/material.dart';
import 'package:hello_world/udacity/unit_commans.dart';

import 'category.dart';

class MultableUnitCoverter extends StatefulWidget {
  final UnitCategorySpec _unitCategorySpec;

  MultableUnitCoverter({
    required UnitCategorySpec unitCategorySpec,
  }) : _unitCategorySpec = unitCategorySpec;


  @override
  State<StatefulWidget> createState() {
    return _MultableUnitCoverterState();
  }
}

class _MultableUnitCoverterState extends State<MultableUnitCoverter> {

  @override
  Widget build(BuildContext context) {
    return buildUnitConverter(context, widget._unitCategorySpec);
  }
}