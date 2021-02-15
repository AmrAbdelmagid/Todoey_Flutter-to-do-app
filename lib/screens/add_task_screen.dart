import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {

  final TextEditingController textEditingController = TextEditingController();
  final Function addTasksCallBack;
  AddTaskScreen({this.addTasksCallBack});

  @override
  Widget build(BuildContext context) {
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
                addTasksCallBack(textEditingController.text);
                Navigator.pop(context);
              },
              child: Text('Add', style: TextStyle(color: Colors.white)),
              color: Colors.lightBlueAccent,
            )
          ],
        ),
      ),
    );
  }
}
