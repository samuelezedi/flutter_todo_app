import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;

  CustomTextField({@required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12)
          ),
          labelText: this.labelText
      ),
    );
  }
}
