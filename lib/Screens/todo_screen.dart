import 'package:flutter/material.dart';

import '../Data/todo.dart';
import '../Widgets/todo_item.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController _textFieldController = TextEditingController();
  final List<Todo> _todos = <Todo>[];

  Future<void> _displayDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Add a new todo item"),
            content: TextField(
              controller: _textFieldController,
              decoration:
                  const InputDecoration(hintText: "digite a new todo item"),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Close")),
              TextButton(
                child: const Text("Add"),
                onPressed: () {
                  Navigator.of(context).pop();
                  if (_textFieldController.text != "") {
                    _addTodoItem(_textFieldController.text);
                  }
                },
              )
            ],
          );
        });
  }

  void _addTodoItem(String name) {
    setState(() {
      _todos.add(Todo(name: name, checked: false));
    });
    _textFieldController.clear();
  }

  void _handleTodoChange(Todo todo) {
    setState(() {
      todo.checked = !todo.checked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("todo list"),
      ),
      body: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          itemCount: _todos.length,
          itemBuilder: (context, index) {
            return TodoItem(
              todo: _todos[index],
              onTodoChanged: _handleTodoChange,
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayDialog(),
        tooltip: "Add Item",
        child: Icon(Icons.add),
      ),
    );
  }
}
