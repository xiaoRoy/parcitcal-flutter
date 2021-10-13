

import 'package:flutter/material.dart';
import 'package:hello_world/udacity/category.dart';
import 'package:hello_world/udacity/unit_commons.dart';

class MutableUnitCategoryListScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MutableUnitCategoryListScreenState();
  }
}


class _MutableUnitCategoryListScreenState extends State {

  List<UnitCategorySpec> _unitCategorySpecList = [];

  @override
  void initState() {
    super.initState();
    _unitCategorySpecList = unitCategorySpecList;
  }

  @override
  Widget build(BuildContext context) {
    return buildUnitConverterList(_unitCategorySpecList);
  }

  
}