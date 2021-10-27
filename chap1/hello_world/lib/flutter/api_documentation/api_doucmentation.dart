

import 'package:flutter/material.dart';
import 'package:hello_world/flutter/api_documentation/constrained_box.dart';
import 'package:hello_world/flutter/api_documentation/dropdown.dart';
import 'package:hello_world/flutter/api_documentation/row.dart';
import 'package:hello_world/flutter/api_documentation/sized_box.dart';
import 'package:hello_world/flutter/api_documentation/text_field.dart';
import 'package:hello_world/flutter/code_lab/sized_box_demonstration.dart';

class ApiDocumentation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('API Documentation'),),
      // body: SizedBoxDemonstration(),
      // body: TextFieldEditingControllerDemonstration(),
      // body: ConstrainedBoxDemonstration(),
      body: SizedBoxDocumentation(),
    );
  }
}
