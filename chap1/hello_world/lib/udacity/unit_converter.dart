import 'package:flutter/material.dart';
import 'package:hello_world/udacity/category.dart';
import 'package:hello_world/udacity/unit_commons.dart';

class UnitConverterScreen extends StatelessWidget {
  final UnitCategorySpec _unitCategorySpec;

  UnitConverterScreen({
    required UnitCategorySpec unitCategorySpec,
  }) : _unitCategorySpec = unitCategorySpec;

  @override
  Widget build(BuildContext context) {
    return buildUnitConverter(context, _unitCategorySpec);
  }
}
