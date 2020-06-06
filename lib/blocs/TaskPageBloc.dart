import 'package:flutter/material.dart';
import 'package:todoapp/widgets/custom_button.dart';
import 'package:todoapp/widgets/custom_datetime_picker.dart';
import 'package:todoapp/widgets/custom_textfield.dart';

class Task {
  final String task;
  final bool isFinish;
  const Task(this.task, this.isFinish);
}

final List<Task> taskList = [
  new Task('Call Samuel about appointment', false),
  new Task('Fix onboarding experience', false),
  new Task('Edit API documents', false),
  new Task('Setup user focus group', false),
  new Task('Have coffee with Sam', true),
  new Task('Meet with sales', true),
];

class AddTaskView extends StatefulWidget {
  @override
  _AddTaskViewState createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {

  String selectedDate = 'Pick Date';
  String selectedTime = 'Pick Time';

  Future _pickDate() async {
    DateTime pickDate = await showDatePicker(context: context,
        initialDate: DateTime.now(), firstDate: DateTime.now().add(Duration(days: -365)), lastDate: DateTime.now().add(Duration(days: 365)));
    if(pickDate != null)
      setState(() {
        selectedDate = pickDate.toString();
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
            child: Text('Add new Task',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),),
          ),
          SizedBox(
            height: 24,
          ),
          CustomTextField(labelText: "Enter Task Name"),
          SizedBox(height: 15,),
          CustomDateTimePicker(iconData: Icons.date_range, value: selectedDate, onPressed: _pickDate,),
          CustomDateTimePicker(iconData: Icons.access_time, value: selectedTime, onPressed: _pickTime,),
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
