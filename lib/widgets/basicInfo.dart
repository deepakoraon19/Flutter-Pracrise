import 'package:flutter/material.dart';

class BasicInfo extends StatelessWidget {
  final int level;
  const BasicInfo({super.key, required this.level});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Current Ninja Level",
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        Text(
          level.toString(),
          style: TextStyle(
              fontSize: 20, color: Colors.amber, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
