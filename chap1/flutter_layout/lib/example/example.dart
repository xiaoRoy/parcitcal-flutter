import 'package:flutter/material.dart';

abstract class Example extends StatelessWidget {
  final String code;

  final String explanation;
  const Example({
    Key? key,
    required this.code,
    required this.explanation,
  }) : super(key: key);
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
