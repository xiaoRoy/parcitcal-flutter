import 'package:flutter/material.dart';
import 'package:hello_world/udacity/unit_commons.dart';
import 'package:hello_world/udacity/unit_converter.dart';
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
  
  @override
  Widget build(BuildContext context) {
    return buildUnitConverterList(unitCategorySpecList);
  }
}

class UnitCategorySpec {
  final String name;
  final Color backgroundColor;
  final List<Unit> unitList;

  const UnitCategorySpec(this.name, this.backgroundColor, this.unitList);
}
