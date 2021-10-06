import 'package:flutter/material.dart';
import 'package:hello_world/udacity/category.dart';

class UnitCoverterScreen extends StatelessWidget {
  final UnitCategorySpec _unitCategorySpec;

  UnitCoverterScreen({
    required UnitCategorySpec unitCategorySpec,
  }) : _unitCategorySpec = unitCategorySpec;

  @override
  Widget build(BuildContext context) {
    final unitWidgetList = _unitCategorySpec.unitList.map((unit) {
      final coversion = (unit.conversion?.toString()) ?? 'no conversion';
      return Container(
        color: _unitCategorySpec.backgroundColor,
        margin: const EdgeInsets.all(6.0),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              unit.name ?? 'empty',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              coversion,
              style: Theme.of(context).textTheme.subtitle1,
            )
          ],
        ),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Unit Converter of ${_unitCategorySpec.name}',
          style: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: _unitCategorySpec.backgroundColor,
      ),
      body: ListView(
        children: unitWidgetList,
      ),
    );
  }
}
