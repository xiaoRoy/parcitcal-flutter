import 'package:flutter/material.dart';
import 'package:flutter_layout/example/example.dart';

class FlutterLayoutArticle extends StatefulWidget {
  final List<Example> examples;

  FlutterLayoutArticle(
    this.examples, {
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}

class _FlutterLayoutArticleState extends State<FlutterLayoutArticle> {
  late int count;
  late Widget example;
  late String code;
  late String explanation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Layout Article',
      home: SafeArea(
        child: Material(
          color: Colors.black,
          child: FittedBox(
            child: Container(
              width: 400,
              height: 670,
              color: const Color(0xFFCCCCCC),
              child: Column(
                children: [
                  _buildExampleSection(),
                  _buildExampleSelectionList(),
                  _buildExplanationSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExampleSection() {
    return Expanded(
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(
          width: double.infinity,
          height: double.infinity,
        ),
        child: widget.examples.last,
      ),
    );
  }

  Widget _buildExampleSelectionList() {
    final count = widget.examples.length;
    final List<Widget> selectionButtonList = List.generate(count, (index) {
      return Container(
        width: 58,
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: _buildSelectionButton(index + 1),
      );
    });

    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.black,
      child: SingleChildScrollView(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: selectionButtonList,
        ),
      ),
    );
  }

  Widget _buildSelectionButton(int exampleNumber) {
    return ExampleSelectionButton(
      key: ValueKey('ExampleSelectionButton$exampleNumber'),
      isSelected: this.count == exampleNumber,
      exampleNumber: exampleNumber,
      onPressed: () {
        final selectedExample = widget.examples[exampleNumber - 1];
        showExample(
            exampleNumber, selectedExample.code, selectedExample.explanation);
      },
    );
  }

  void showExample(int exampleNumber, String code, String explanation) {
    setState(() {
      count = exampleNumber;
      this.code = code;
      this.explanation = explanation;
    });
  }

  Widget _buildExplanationSection() {
    return Container(
      height: 273,
      color: Colors.grey[50],
      child: Scrollbar(
        child: SingleChildScrollView(
          key: ValueKey(count),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Center(child: Text(this.code)),
                const SizedBox(height: 15),
                Text(
                  explanation,
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
