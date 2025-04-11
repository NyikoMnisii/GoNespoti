import 'package:flutter/material.dart';

class SingleLineInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData? icon; // Add an optional icon parameter

  const SingleLineInputField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.icon, // Make the icon optional
    bool obscureText = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[500]),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        prefixIcon: icon != null ? Icon(icon) : null, // Show the icon if provided
      ),
    );
  }
}
