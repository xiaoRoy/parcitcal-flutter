import 'package:flutter/material.dart';

class DropdownDemonstrtion extends StatefulWidget {
  const DropdownDemonstrtion({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DropdownDemonstrtionState();
}

class _DropdownDemonstrtionState extends State<DropdownDemonstrtion> {
  static const _dropdownItems = <String>[
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
  ];
  String _selectedValue = _dropdownItems.first;

  @override
  Widget build(BuildContext context) {
    final ValueChanged<String?> onChanged = (String? value) {
      if (value != null) {
        setState(() {
          _selectedValue = value;
        });
      }
    };
    return Center(
      child: DropdownButton<String>(
        value: _selectedValue,
        dropdownColor: Colors.deepOrange,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        underline: Container(
          height: 2,
          color: Colors.amberAccent,
        ),
        items: _dropdownItems.map(_buildDropdownItem).toList(),
        onChanged: onChanged,
      ),
    );
  }

  DropdownMenuItem<String> _buildDropdownItem(String item) {
    return DropdownMenuItem<String>(
      child: Text(item),
      value: item,
    );
  }
}
