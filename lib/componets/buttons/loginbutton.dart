import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Function onPressed;

  LoginButton({
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor, // background color
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
