import 'package:flutter/material.dart';

import 'Screens/todo_screen.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "to do app",
      home: TodoList(),
    );
  }
}
