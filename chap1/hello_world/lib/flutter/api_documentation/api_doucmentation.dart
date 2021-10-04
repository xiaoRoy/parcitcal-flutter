

import 'package:flutter/material.dart';
import 'package:hello_world/flutter/api_documentation/row.dart';

class ApiDocumentation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API Documentation'),),
      body: FlexibleFitPropertyDemonstration(),
    );
  }
}
