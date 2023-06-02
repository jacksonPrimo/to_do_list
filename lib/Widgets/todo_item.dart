import 'package:flutter/material.dart';

import '../Data/todo.dart';

class TodoItem extends StatelessWidget {
  TodoItem({required this.todo, required this.onTodoChanged})
      : super(key: ObjectKey(todo));

  final Todo todo;
  final onTodoChanged;

  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;

    return TextStyle(
        color: Colors.black54, decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        onTodoChanged(todo);
      },
      leading: CircleAvatar(
        child: Text(todo.name),
      ),
      title: Text(todo.name, style: _getTextStyle(todo.checked)),
    );
  }
}
