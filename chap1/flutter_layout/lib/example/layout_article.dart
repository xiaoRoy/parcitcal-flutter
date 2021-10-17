import 'package:flutter/material.dart';
import 'package:flutter_layout/example/example.dart';

class FlutterLayoutArticle extends StatefulWidget {
  final List<Example> examples;

  const FlutterLayoutArticle(
    this.examples, {
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FlutterLayoutArticleState();
}

class _FlutterLayoutArticleState extends State<FlutterLayoutArticle> {
  late int exampleNumber;
  late Widget example;
  late String code;
  late String explanation;

  @override
  void initState() {
    const example1 = const Example1();
    exampleNumber = 1;
    this.code = example1.code;
    this.explanation = example1.explanation;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FlutterLayoutArticle oldWidget) {
    super.didUpdateWidget(oldWidget);
    final example = widget.examples[exampleNumber -1];
    this.code = example.code;
    this.explanation = example.explanation;
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
                crossAxisAlignment: CrossAxisAlignment.center,
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


  // Example Section()
  Widget _buildExampleSection() {
    return Expanded(
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(
          width: double.infinity,
          height: double.infinity,
        ),
        child: widget.examples[exampleNumber - 1],
      ),
    );
  }

  //Example Selection List
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
        scrollDirection: Axis.horizontal,
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
      isSelected: this.exampleNumber == exampleNumber,
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
      this.exampleNumber = exampleNumber;
      this.code = code;
      this.explanation = explanation;
    });
  }

  //Explanation Section
  Widget _buildExplanationSection() {
    return Container(
      height: 273,
      color: Colors.grey[50],
      child: Scrollbar(
        child: SingleChildScrollView(
          key: ValueKey(exampleNumber),
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
