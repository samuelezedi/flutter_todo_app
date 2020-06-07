import 'package:flutter/material.dart';
import 'package:todoapp/blocs/TaskPageBloc.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {

  Widget _taskUnComplete(String text) {
    return GestureDetector(
      onTap: (){
          //TODO complete the task
      },
      onLongPress: (){
        //TODO delete the task
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 12, top: 12, right: 24),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.radio_button_unchecked,
              color: Theme.of(context).accentColor,
              size: 20,
            ),
            SizedBox(width: 28,),
            Text(text)
          ],
        ),
      ),
    );
  }

  Widget _taskComplete(String text) {
    return Container(
      foregroundDecoration: BoxDecoration(
          color: Color(0x60FDFDFD)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 24),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.radio_button_checked,
              color: Theme.of(context).accentColor,
              size: 20,
            ),
            SizedBox(width: 28,),
            Text(text)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: taskList.length,
        itemBuilder: (context, index){
        return taskList[index].isFinish ? _taskComplete(taskList[index].task) : _taskUnComplete(taskList[index].task);
    });
  }
}
