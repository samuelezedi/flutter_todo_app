import 'package:flutter/material.dart';

class Event {
  final String time;
  final String task;
  final String desc;
  final bool isFinish;

  Event(this.time, this.task, this.desc, this.isFinish);

  final List<Event> eventList = [
    new Event('08:00' , 'Call Samuel about appointment', 'Personal', false),
    new Event('08:00' , 'Call Samuel about appointment', 'Personal', false),
    new Event('08:00' , 'Call Samuel about appointment', 'Personal', false),
    new Event('08:00' , 'Call Samuel about appointment', 'Personal', false),
    new Event('08:00' , 'Call Samuel about appointment', 'Personal', false),
    new Event('08:00' , 'Call Samuel about appointment', 'Personal', false),
  ];

}