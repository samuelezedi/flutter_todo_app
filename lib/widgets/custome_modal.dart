import 'package:flutter/material.dart';
import 'package:todoapp/blocs/EventPageBloc.dart';
import 'package:todoapp/blocs/TaskPageBloc.dart';

class CustomModal extends StatelessWidget {
  final double currentView;
  CustomModal(this.currentView);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      child: currentView == 0 ? AddTaskView() : AddEventView(),
    );
  }
}
