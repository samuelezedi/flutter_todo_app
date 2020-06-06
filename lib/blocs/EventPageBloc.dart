import 'package:flutter/material.dart';
import 'package:todoapp/widgets/custom_button.dart';
import 'package:todoapp/widgets/custom_textfield.dart';

class Event {
  final String time;
  final String task;
  final String desc;
  final bool isFinish;

  Event(this.time, this.task, this.desc, this.isFinish);

}

class AddEventView extends StatefulWidget {
  @override
  _AddEventViewState createState() => _AddEventViewState();
}

class _AddEventViewState extends State<AddEventView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: Text('Add new Event',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
            ),),
          ),
          SizedBox(
            height: 24,
          ),
          CustomTextField(labelText: "Enter Event Name"),
          SizedBox(
            height: 15,
          ),
          CustomTextField(labelText: "Enter Description"),
          SizedBox(
            height: 15,
          ),
          FlatButton(
            padding: EdgeInsets.zero,
            onPressed: (){},
            child: Row(
              children: <Widget>[
                Icon(Icons.date_range,color: Theme.of(context).accentColor,size: 30,),
                SizedBox(width: 12,),
                Text('Pick date',style: TextStyle(fontSize: 14),)
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          _actionButtons(context)
        ],
      ),
    );
  }

  Widget _actionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CustomButton(
          onPressed: (){
            Navigator.pop(context);
          },
          buttonText: "Close",
        ),
        CustomButton(
          onPressed: (){
            // TODO
          },
          color: Theme.of(context).accentColor,
          textColor: Colors.white,
          buttonText: "Save",
        )
      ],
    );
  }
}

