import 'package:flutter/material.dart';
import 'package:todoapp/widgets/custom_button.dart';

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
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              labelText: "Enter Task Name"
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
