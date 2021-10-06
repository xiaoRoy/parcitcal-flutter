import 'package:flutter/material.dart';
import 'package:hello_world/udacity/category.dart';
import 'package:hello_world/udacity/unit_commans.dart';

class UnitCoverterScreen extends StatelessWidget {
  final UnitCategorySpec _unitCategorySpec;

  UnitCoverterScreen({
    required UnitCategorySpec unitCategorySpec,
  }) : _unitCategorySpec = unitCategorySpec;

  @override
  Widget build(BuildContext context) {
    return buildUnitConverter(context, _unitCategorySpec);
  }
}
