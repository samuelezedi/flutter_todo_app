import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color textColor;
  final Color color;
  final Color borderColor;

  CustomButton(
      {this.onPressed,
      this.borderColor = Colors.transparent,
      this.textColor,
      this.color,
      this.buttonText});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: borderColor
        )
      ),
      color: color,
      textColor: textColor,
      padding: EdgeInsets.all(14),
      child: Text(buttonText),
    );
  }
}
