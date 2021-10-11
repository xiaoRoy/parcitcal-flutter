import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
        ),
      ),
    );
  }
}

class TextFieldEditingControllerDemonstration extends StatefulWidget {
  const TextFieldEditingControllerDemonstration({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TextFieldEditingControllerDemonstrationState();
  }
}

class _TextFieldEditingControllerDemonstrationState
    extends State<TextFieldEditingControllerDemonstration> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(24.0),
        child: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          onSubmitted: (String input) async {
            await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Thanks'),
                content:
                    Text('You typed $input, which has length ${input.length}.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
