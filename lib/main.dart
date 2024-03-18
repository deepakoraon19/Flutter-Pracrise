import 'package:flutter/material.dart';
import 'package:hello/models/mortal.dart';
import 'package:hello/widgets/basicInfo.dart';
import 'package:hello/widgets/contact.dart';
import 'package:hello/widgets/mortalPedia.dart';
import 'package:hello/widgets/name.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 81, 82, 82),
          title: Text(
            "MortalsPedia",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: MortalPedia(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            shape: CircleBorder(),
            backgroundColor: const Color.fromARGB(255, 55, 54, 54),
            child: Text(
              '+',
              style: TextStyle(fontSize: 25, color: Colors.amber),
            )),
      ),
    );
  }
}
