import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskRepository {
  List<Task> _tasks = [];

  List<Task> getTasks() {
    return _tasks;
  }

  void addTask(Task task) {
    _tasks.add(task);
  }

  void updateTask(int index, Task updatedTask) {
    _tasks[index] = updatedTask;
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
  }
}
