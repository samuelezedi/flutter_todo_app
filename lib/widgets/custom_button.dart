import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color textColor;
  final Color color;
  final Color borderColor;

  CustomButton(
      {this.onPressed,
      this.borderColor,
      this.textColor,
      this.color,
      this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
