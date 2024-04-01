import 'package:flutter/material.dart';
import 'package:hello/models/todo.dart';
import 'package:hello/widgets/todo/todo_tile.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List<ToDoItem> todoList = [];
  List<ToDoTile> todoTiles = [];

  final titleController = TextEditingController();
  final descController = TextEditingController();

  void resetFields() {
    titleController.clear();
    descController.clear();
  }

  @override
  void initState() {
    super.initState();
    todoTiles = todoList.map((e) => ToDoTile(item: e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [...todoTiles]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Add Item'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: InputDecoration(hintText: "Title"),
                        controller: titleController,
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: "Description"),
                        controller: descController,
                        minLines: 4,
                        maxLines: 10,
                        keyboardType: TextInputType.multiline,
                      )
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        resetFields();
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Submit'),
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          shape: CircleBorder(),
          backgroundColor: const Color.fromARGB(255, 55, 54, 54),
          child: Text(
            '+',
            style: TextStyle(fontSize: 25, color: Colors.amber),
          )),
    );
  }
}
