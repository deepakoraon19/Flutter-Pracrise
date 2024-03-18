import "package:flutter/material.dart";

class Tiles extends StatelessWidget {
  final String imgURL;
  final String name;
  const Tiles({super.key, required this.imgURL, required this.name});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(imgURL),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            name,
            style: TextStyle(color: Colors.amber, fontSize: 18),
          ),
        )
      ],
    );
  }
}
