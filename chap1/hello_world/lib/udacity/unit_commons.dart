import 'package:flutter/material.dart';
import 'package:hello_world/udacity/category.dart';
import 'package:hello_world/udacity/unit.dart';
import 'package:hello_world/udacity/unit_converter.dart';
import 'package:hello_world/udacity/unit_converter_mutable.dart';

List<Unit> _retrieveUnitList(String categoryName) {
  return List.generate(
      10,
      (index) => Unit(
            name: '$categoryName Unit#$index',
            conversion: index.toDouble(),
          ));
}

final unitCategorySpecList = [
  UnitCategorySpec('Length', Colors.teal, _retrieveUnitList('Length')),
  UnitCategorySpec('Area', Colors.orange, _retrieveUnitList('Area')),
  UnitCategorySpec('Volume', Colors.pinkAccent, _retrieveUnitList('Volume')),
  UnitCategorySpec('Mass', Colors.blueAccent, _retrieveUnitList('Mass')),
  UnitCategorySpec('Time', Colors.yellow, _retrieveUnitList('Time')),
  UnitCategorySpec('Digital Storage', Colors.greenAccent,
      _retrieveUnitList('Digital Storage')),
  UnitCategorySpec('Energy', Colors.purpleAccent, _retrieveUnitList('Energy')),
  UnitCategorySpec('Currency', Colors.red, _retrieveUnitList('Currency')),
];

Widget buildUnitConverterList(List<UnitCategorySpec> unitCategorySpecList) {
  return Container(
    color: Colors.green[100],
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: ListView.builder(
      itemBuilder: (context, index) =>
          _buildUnitConverterItem(context, unitCategorySpecList[index]),
      itemCount: unitCategorySpecList.length,
    ),
  );
}

Widget _buildUnitConverterItem(
  BuildContext context,
  UnitCategorySpec unitCategorySpec,
) {
  return Category(
    text: unitCategorySpec.name,
    color: unitCategorySpec.backgroundColor as ColorSwatch<dynamic>,
    iconData: Icons.cake,
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MutableUnitConverter(
          unitCategorySpec: unitCategorySpec,
        ),
      ));
    },
  );
}

Widget buildUnitConverter(
    BuildContext context, UnitCategorySpec unitCategorySpec) {
  final unitWidgetList = unitCategorySpec.unitList.map((unit) {
    final conversion = (unit.conversion?.toString()) ?? 'no conversion';
    return Container(
      color: unitCategorySpec.backgroundColor,
      margin: const EdgeInsets.all(6.0),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            unit.name ?? 'empty',
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            conversion,
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      ),
    );
  }).toList();

  return Scaffold(
    appBar: AppBar(
      title: Text(
        'Unit Converter of ${unitCategorySpec.name}',
        style: Theme.of(context).textTheme.headline6,
      ),
      backgroundColor: unitCategorySpec.backgroundColor,
    ),
    body: ListView(
      children: unitWidgetList,
    ),
  );
}
