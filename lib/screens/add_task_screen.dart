import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {

  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context,taskData,child){
      return Container(
        color: Color(0xff757575),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.w400),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                controller: textEditingController,
              ),
              SizedBox(height: 25.0,),
              FlatButton(
                onPressed: (){
                  taskData.addTask(textEditingController.text);
                  Navigator.pop(context);
                  // addTasksCallBack(textEditingController.text);
                },
                child: Text('Add', style: TextStyle(color: Colors.white)),
                color: Colors.lightBlueAccent,
              )
            ],
          ),
        ),
      );
    },
    );
  }
}
