import 'package:flutter/material.dart';

const red = Colors.red;
const green = Colors.green;
const blue = Colors.blue;
const big = TextStyle(fontSize: 30);

abstract class Example extends StatelessWidget {
  String get code;

  String get explanation;

  const Example({Key? key}) : super(key: key);
}

class Example1 extends Example {
  @override
  final code = 'Container(color:red)';

  @override
  final explanation = 'The screen is the parent of the Container,'
      'and it forces the Container to be exactly the same size as the screen.'
      '\n\n'
      'So the Container fills the screen and paints it red.';

  const Example1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: red);
  }
}

class Example2 extends Example {
  const Example2({Key? key}) : super(key: key);

  @override
  final code = 'Container(width: 100, height: 100, color: red)';

  @override
  final explanation = 'The red Container wants be 100 x 100. but it can\'t, '
      'because the screen force it to be exactly the same size as the screen.'
      '\n\n'
      'So the Container fill the screen.';

  @override
  Widget build(BuildContext context) {
    return Container(width: 100, height: 100, color: red);
  }
}

class Example3 extends Example {
  const Example3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(width: 100, height: 100, color: red));
  }

  @override
  final String code = 'Center(\n'
    '     child: Container(width: 100, height: 100))';

  @override
  final String explanation =
      'The screen forces the Center to be exactly the same size as the screen,'
      'So the Center fills the screen.'
      '\n\n'
      'The Center tells the Container that it can be any size it wants, but not bigger than the screen.'
      'Now the Container can indeed be 100x100.';
}

class Example4 extends Example {
  const Example4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomRight,
        child: Container(width: 100, height: 100, color: red));
  }

  @override
  final code = 'Align(\n'
      '   alignment: Alignment.bottomRight,\n'
      '   child: Container(width: 100, height: 100, color: red))\n';

  @override
  final String explanation =
      'This is different from the Example4 in that it uses Align instead of Center'
      '\n\n'
      'Align also tells the Container that it can be any size it wants, but if there is empty space it won\'t center the'
      'Instead, it aligns the Container to the bottom-right of the available space.';
}

class ExampleSelectionButton extends StatelessWidget {
  final bool isSelected;
  final int exampleNumber;
  final VoidCallback onPressed;

  const ExampleSelectionButton({
    required Key key,
    required this.isSelected,
    required this.exampleNumber,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: isSelected ? Colors.grey : Colors.grey[800],
      ),
      onPressed: () {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOut,
          alignment: 0.5,
        );
        onPressed();
      },
      child: Text(exampleNumber.toString()),
    );
  }
}
