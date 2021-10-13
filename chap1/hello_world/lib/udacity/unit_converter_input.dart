import 'package:flutter/material.dart';
import 'package:hello_world/udacity/unit.dart';

class UnitConverterInput extends StatefulWidget {
  final List<Unit> _unitList;

  UnitConverterInput(this._unitList);

  @override
  State<StatefulWidget> createState() {
    return _UnitConverterInputState();
  }
}

class _UnitConverterInputState extends State<UnitConverterInput> {
  late Unit _selectedUnit;

  @override
  void initState() {
    super.initState();
    _selectedUnit = widget._unitList.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [_buildInputTextField()],
      ),
    );
  }

  Widget _buildInputTextField() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: 'Input'),
    );
  }

  Widget _buildUnitDropdown() {
    final unitList = widget._unitList;
    return DropdownButton(items: unitList.map(_buildUnitDropdownItem).toList());
  }

  DropdownMenuItem<Unit> _buildUnitDropdownItem(Unit unit) {
    return DropdownMenuItem<Unit>(
      child: Text(unit.name ?? ''),
      value: unit,
    );
  }
}
