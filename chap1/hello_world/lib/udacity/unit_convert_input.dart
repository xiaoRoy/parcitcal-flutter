import 'package:flutter/material.dart';
import 'package:hello_world/udacity/unit.dart';

class UnitCoverterInput extends StatefulWidget {
  final List<Unit> _unitList;

  UnitCoverterInput(this._unitList);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _UnitCoverterInputState extends State<UnitCoverterInput> {
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
        children: [],
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
    return DropdownButton(items: unitList.map(_buildUnitDropdwonItem).toList());
  }

  DropdownMenuItem<Unit> _buildUnitDropdwonItem(Unit unit) {
    return DropdownMenuItem<Unit>(
      child: Text(unit.name ?? ''),
      value: unit,
    );
  }
}
