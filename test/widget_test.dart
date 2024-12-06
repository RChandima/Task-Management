import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager/main.dart'; // Replace 'task_manager' with your project name

void main() {
  testWidgets('Task Manager initial screen smoke test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const TaskManagerApp());

    // Verify that the initial screen displays "Task Manager" in the AppBar.
    expect(find.text('Task Manager'), findsOneWidget);

    // Add additional tests as needed for specific functionality.
  });
}
