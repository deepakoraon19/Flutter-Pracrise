import 'package:flutter/material.dart';
import 'package:hello/screens/mortalPedia/mortal_detail.dart';
import 'package:hello/screens/todo/to_do.dart';
import 'package:hello/widgets/calc.dart';
import 'package:hello/screens/mortalPedia/mortalPedia.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome(), routes: {
      '/add': (context) => Home(),
      '/details': (context) => MortalDetail(),
    });
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 35, 36, 36),
          title: Text(
            "To-do",
            style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Todo());
  }
}
