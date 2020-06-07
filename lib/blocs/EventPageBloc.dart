import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/widgets/custom_button.dart';
import 'package:todoapp/widgets/custom_datetime_picker.dart';
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

  DateTime selectedDate = DateTime.now();
  String selectedTime = 'Pick Time';

  Future _pickDate() async {
    DateTime pickDate = await showDatePicker(context: context,
        initialDate: DateTime.now(), firstDate: DateTime.now().add(Duration(days: -365)), lastDate: DateTime.now().add(Duration(days: 365)));
    if(pickDate != null)
      setState(() {
        selectedDate = pickDate;
      });
  }

  Future _pickTime() async {
    TimeOfDay pickTime = await showTimePicker(context: context,
        initialTime: TimeOfDay.now());
    if(pickTime != null)
      setState(() {
        selectedTime = pickTime.toString();
      });
  }

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
          CustomDateTimePicker(
              iconData: Icons.date_range, 
              value: DateFormat('dd-MM-yyyy').format(selectedDate), 
              onPressed: _pickDate),
          SizedBox(
            height: 15,
          ),
          CustomDateTimePicker(iconData: Icons.access_time, value: selectedTime, onPressed: _pickTime),
          SizedBox(
            height: 24,
          ),
          _actionButtons(context)
        ],
      ),
    );
  }

  Widget _dateTimePicker(IconData icon, String value, VoidCallback function) {
    return FlatButton(
          padding: EdgeInsets.zero,
          onPressed: function,
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              children: <Widget>[
                Icon(icon,color: Theme.of(context).accentColor,size: 30,),
                SizedBox(width: 12,),
                Text(value, style: TextStyle(fontSize: 14),)
              ],
            ),
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

