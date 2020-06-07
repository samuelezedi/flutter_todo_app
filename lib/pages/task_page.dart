import 'package:flutter/material.dart';
import 'package:todoapp/blocs/TaskPageBloc.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {

  Widget _taskUnComplete(String text) {
    return InkWell(
      onTap: (){
          //TODO complete the task
        showDialog(context: context,
          builder: (context){
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Are you sure you want to delete this?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),)
                ],
              ),
            );
          }
        );
      },
      onLongPress: (){
        //TODO delete the task
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12,),
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
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
