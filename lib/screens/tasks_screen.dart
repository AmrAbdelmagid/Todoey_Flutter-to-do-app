import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/tasks_list.dart';
import 'add_task_screen.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context , taskData , child){
        return Scaffold(
          backgroundColor: Colors.lightBlueAccent,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return SingleChildScrollView(
                      child: AddTaskScreen(
                        addTasksCallBack: (taskVal) {
                          taskData.tasks
                              .add(Task(name: taskVal));
                          //tasks.add(Task(name: taskVal));
                        },
                      ),
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                    );
                  });
            },
            child: Icon(Icons.add),
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: 60.0, bottom: 30.0, left: 30.0, right: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30.0,
                        child: Icon(
                          Icons.list,
                          color: Colors.lightBlueAccent,
                          size: 30.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Todoey',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 30.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        (taskData.taskCount == 1)
                            ? (taskData.taskCount.toString() +
                            ' task')
                            : (taskData.taskCount.toString() +
                            ' tasks'),
                        //(tasks.length == 1) ? (tasks.length.toString() + ' task') : (tasks.length.toString() + ' tasks') ,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      color: Colors.white,
                    ),
                    child: TasksList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}
