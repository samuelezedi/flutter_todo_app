import 'package:flutter/material.dart';
import 'package:todoapp/blocs/TaskPageBloc.dart';
import 'package:todoapp/widgets/custom_button.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {

  Widget _taskUnComplete(Task task) {
    return InkWell(
      onTap: (){
          //TODO complete the task
        showDialog(context: context,
          builder: (context){
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Comfirm Task Completion',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),),
                    SizedBox(
                      height: 24,
                    ),
                    Text(task.task),
                    SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CustomButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          buttonText: 'Close',
                        ),
                        CustomButton(
                          onPressed: (){

                          },
                          textColor: Colors.white,
                          buttonText: 'Complete',
                          color: Theme.of(context).accentColor,
                        ),
                      ],
                    ),
                  ],
                ),
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
            Text(task.task)
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
        return taskList[index].isFinish ? _taskComplete(taskList[index].task) : _taskUnComplete(taskList[index]);
    });
  }
}
