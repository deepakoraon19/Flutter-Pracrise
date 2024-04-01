import 'package:flutter/material.dart';
import 'package:hello/models/todo.dart';

class ToDoTile extends StatelessWidget {
  final ToDoItem item;
  const ToDoTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(item.title),
    );
  }
}
