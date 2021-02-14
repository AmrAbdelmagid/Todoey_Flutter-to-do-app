import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('this is a task.',style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough : null),),
      trailing: TaskTileCheckbox(checkboxState: isChecked,checkboxCallback: (value){
        setState(() {
          isChecked = value;
        });
      },),
    );
  }
}

class TaskTileCheckbox extends StatelessWidget {
  final bool checkboxState;
  final Function checkboxCallback;
  TaskTileCheckbox({this.checkboxState,this.checkboxCallback});
  @override
  Widget build(BuildContext context) {
    return Checkbox(value: checkboxState,onChanged: checkboxCallback,);
  }
}
