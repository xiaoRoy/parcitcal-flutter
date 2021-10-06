

import 'package:flutter/material.dart';
import 'package:hello_world/udacity/category.dart';
import 'package:hello_world/udacity/unit_commans.dart';

class MultableUnitCategoryListScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MultableUnitCategoryListScreenState();
  }
}


class _MultableUnitCategoryListScreenState extends State {

  List<UnitCategorySpec> _unitCategorySpecList = [];

  @override
  void initState() {
    super.initState();
    _unitCategorySpecList = unitCategorySpecList;
  }

  @override
  Widget build(BuildContext context) {
    return buildUnitCoverterList(unitCategorySpecList);
  }

  
}