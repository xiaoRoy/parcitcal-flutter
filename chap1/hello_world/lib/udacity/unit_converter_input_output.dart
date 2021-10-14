import 'package:flutter/material.dart';
import 'package:hello_world/udacity/unit_converter_input.dart';

import 'category.dart';

class UnitConverterInputAndOut extends StatelessWidget {
  final UnitCategorySpec _unitCategorySpec;

  UnitConverterInputAndOut({
    required UnitCategorySpec unitCategorySpec,
  }) : _unitCategorySpec = unitCategorySpec;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Coveter'),
      ),
      body: Column(
        children: [UnitConverterInput(_unitCategorySpec.unitList)],
      ),
    );
  }
}
