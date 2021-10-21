import 'package:flutter/material.dart';
import 'package:flutter_layout/example/example.dart';
import 'package:flutter_layout/example/layout_article.dart';

void main() {
  runApp(LayoutExampleHomePage());
}

class LayoutExampleHomePage extends StatelessWidget {

  const LayoutExampleHomePage({Key? key}): super(key: key);

    @override
  Widget build(BuildContext context) {
    return const FlutterLayoutArticle([
      Example1(),
      Example2(),
      Example3(),
      Example4(),
    ]);
  }
}
