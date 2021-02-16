import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasksListData = [
    Task(name: 'finish my course'),
  ];
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasksListData);
}
  int get taskCount => _tasksListData.length;
  void addTask(String task){
    _tasksListData.add(Task(name: task));
    notifyListeners();
  }
}