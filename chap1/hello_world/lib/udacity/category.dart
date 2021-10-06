import 'package:flutter/material.dart';
import 'package:hello_world/udacity/unit_coverter.dart';
import 'unit.dart';

class Category extends StatelessWidget {
  final Color _color;
  final String _text;
  final IconData _iconData;
  final GestureTapCallback? _onTap;

  Category({
    required Color color,
    required String text,
    required IconData iconData,
    GestureTapCallback? onTap,
  })  : _color = color,
        _text = text,
        _iconData = iconData,
        _onTap = onTap;

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
          onTap: _onTap,
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
  static List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(
        10,
        (index) => Unit(
            name: '$categoryName Unit#$index', conversion: index.toDouble()));
  }

  static final _unitCategorySpecList = [
    UnitCategorySpec('Length', Colors.teal, _retrieveUnitList('Length')),
    UnitCategorySpec('Area', Colors.orange, _retrieveUnitList('Area')),
    UnitCategorySpec('Volume', Colors.pinkAccent, _retrieveUnitList('Volume')),
    UnitCategorySpec('Mass', Colors.blueAccent, _retrieveUnitList('Mass')),
    UnitCategorySpec('Time', Colors.yellow, _retrieveUnitList('Time')),
    UnitCategorySpec('Digital Storage', Colors.greenAccent, _retrieveUnitList('Digital Storage')),
    UnitCategorySpec('Energy', Colors.purpleAccent, _retrieveUnitList('Energy')),
    UnitCategorySpec('Currency', Colors.red, _retrieveUnitList('Currency')),
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
      color: unitCategorySpec.backgroundColor as ColorSwatch<dynamic>,
      iconData: Icons.cake,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UnitCoverterScreen(
            unitCategorySpec: unitCategorySpec,
          ),
        ));
      },
    );
  }
}

class UnitCategorySpec {
  final String name;
  final Color backgroundColor;
  final List<Unit> unitList;

  const UnitCategorySpec(this.name, this.backgroundColor, this.unitList);
}
