import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../viewmodels/task_view_model.dart';
import 'task_form_screen.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  void initState() {
    super.initState();
    // Load tasks on initial screen load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TaskViewModel>().loadTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Consumer<TaskViewModel>(
        builder: (context, taskViewModel, child) {
          return ListView.builder(
            itemCount: taskViewModel.tasks.length,
            itemBuilder: (context, index) {
              final task = taskViewModel.tasks[index];
              return ListTile(
                title: Text(
                  task.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(task.description),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => taskViewModel.deleteTask(index),
                ),
                onTap: () async {
                  final updatedTask = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskFormScreen(task: task),
                    ),
                  );
                  if (updatedTask != null) {
                    taskViewModel.updateTask(index, updatedTask);
                  }
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskFormScreen(task: null),
            ),
          );
          if (result != null) {
            context.read<TaskViewModel>().addTask(result);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
