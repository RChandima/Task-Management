import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskViewModel extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => List.unmodifiable(_tasks);

  Future<void> loadTasks() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate async operation
    if (_tasks.isEmpty) {
      _tasks.addAll([
        Task(title: "Task 1", description: "Description for Task 1"),
        Task(title: "Task 2", description: "Description for Task 2"),
      ]);
    }
    notifyListeners();
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners(); // Notify UI about changes
  }

  void updateTask(int index, Task updatedTask) {
    _tasks[index] = updatedTask;
    notifyListeners(); // Notify UI about changes
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners(); // Notify UI about changes
  }
}
