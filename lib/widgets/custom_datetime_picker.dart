import 'package:flutter/material.dart';

class CustomDateTimePicker extends StatelessWidget {

  final IconData iconData;
  final String value;
  final VoidCallback onPressed;

  CustomDateTimePicker({this.iconData, this.value, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.zero,
      onPressed: this.onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Row(
          children: <Widget>[
            Icon(this.iconData, color: Theme.of(context).accentColor,size: 30,),
            SizedBox(width: 12,),
            Text(this.value, style: TextStyle(fontSize: 14),)
          ],
        ),
      ),
    );
  }
}
