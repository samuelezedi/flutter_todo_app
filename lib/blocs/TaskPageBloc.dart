import 'package:flutter/material.dart';

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