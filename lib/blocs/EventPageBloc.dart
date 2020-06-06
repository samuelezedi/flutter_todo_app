import 'package:flutter/material.dart';

class Event {
  final String time;
  final String task;
  final String desc;
  final bool isFinish;

  Event(this.time, this.task, this.desc, this.isFinish);

}

class AddTaskView extends StatefulWidget {
  @override
  _AddTaskViewState createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text('Add new Task'),
        ),
      ],
    );
  }
}
