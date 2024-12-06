import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/task_view_model.dart';
import 'screens/task_list_screen.dart';

void main() {
  runApp(TaskManagerApp());
}

class TaskManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskViewModel(),
      child: MaterialApp(
        title: 'Task Manager',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TaskListScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
