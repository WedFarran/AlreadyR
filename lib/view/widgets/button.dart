import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onpress;
  final String text;
  final Color backColour;
  final Color textColour;
  Button(
      {required this.onpress,
      required this.text,
      required this.backColour,
      required this.textColour});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: backColour,
          minimumSize: Size(250.0, 40.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0))),
      onPressed: onpress,
      child: Text(
        text,
        style: TextStyle(color: textColour),
      ),
    );
  }
}
