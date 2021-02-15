import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:todoey/models/task.dart';

List<Task> tasks = [
 Task(name: 'finish my course'),
 Task(name: 'meet my friends'),
 Task(name: 'do my work'),
];

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,index){
        return TaskTile(name: tasks[index].name,isChecked: tasks[index].isDone,onChangedCallback: (checkboxState){
          setState(() {
            tasks[index].toggleIsDone();
          });
        },);
      },
      itemCount: tasks.length,
    );
  }
}

