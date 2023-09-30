import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  //Ignore imutable error

  final String buttonText;
  final VoidCallback onPressed;
  const MyButtons(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(buttonText),
    );
  }
}
