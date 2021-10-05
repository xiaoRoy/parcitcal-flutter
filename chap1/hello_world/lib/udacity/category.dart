import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final Color _color;
  final String _text;
  final IconData _iconData;

  Category({
    required Color color,
    required String text,
    required IconData iconData,
  })  : _color = color,
        _text = text,
        _iconData = iconData;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        height: 100.0,
        child: InkWell(
          borderRadius: BorderRadius.circular(50.0),
          highlightColor: _color,
          splashColor: _color,
          onTap: () {},
          child: _buildBaseCategory(context),
        ),
      ),
    );
  }

  Padding _buildBaseCategory(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              _iconData,
              size: 60.0,
            ),
          ),
          Center(
            child: Text(_text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5),
          ),
        ],
      ),
    );
  }
}

class UnitCategoryListScreen extends StatelessWidget {
  static const _unitCategorySpecList = [
    _UnitCategorySpec('Length', Colors.teal),
    _UnitCategorySpec('Area', Colors.orange),
    _UnitCategorySpec('Volume', Colors.pinkAccent),
    _UnitCategorySpec('Mass', Colors.blueAccent),
    _UnitCategorySpec('Time', Colors.yellow),
    _UnitCategorySpec('Digital Storage', Colors.greenAccent),
    _UnitCategorySpec('Energy', Colors.purpleAccent),
    _UnitCategorySpec('Currency', Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return _buildUnitCoverterList();
  }

  Widget _buildUnitCoverterList() {
    return Container(
      color: Colors.green[100],
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
        itemBuilder: _buildUnitCoverterItem,
        itemCount: _unitCategorySpecList.length,
      ),
    );
  }

  Widget _buildUnitCoverterItem(BuildContext context, int index) {
    final unitCategorySpec = _unitCategorySpecList[index];
    return Category(
      text: unitCategorySpec.name,
      color: unitCategorySpec.splashColor as ColorSwatch<dynamic>,
      iconData: Icons.cake,
    );
  }
}

class _UnitCategorySpec {
  final String name;
  final Color splashColor;

  const _UnitCategorySpec(this.name, this.splashColor);
}
