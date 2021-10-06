import 'package:flutter/material.dart';

class TodoItem {
  String title;

  String description;

  TodoItem({required this.title, required this.description});
}

class TodoListScreen extends StatelessWidget {
  static final List<TodoItem> todoList = List.generate(
      24,
      (index) => TodoItem(
            title: 'Todo #$index',
            description:
                'A description of what needs to be done for Toto #$index',
          ));


  Route _buildRouteToTodoDetailScreen(TodoItem todoItem) {
    return MaterialPageRoute(builder: (context) => TodoDetailScreen(todoItem: todoItem));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final todoItem = todoList[index];
          return ListTile(
            title: Text(todoItem.title),
            onTap: () {
              Navigator.push(context, _buildRouteToTodoDetailScreen(todoItem));
            },
          );
        },
        itemCount: todoList.length,
      ),
    );
  }
}

class TodoDetailScreen extends StatelessWidget {
  final TodoItem _todoItem;

  TodoDetailScreen({required TodoItem todoItem}) : _todoItem = todoItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_todoItem.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(_todoItem.description),
      ),
    );
  }
}
