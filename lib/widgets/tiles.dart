import "package:flutter/material.dart";

class Tiles extends StatelessWidget {
  final String imgURL;
  final String name;
  final int level;
  final delete;
  const Tiles({
    super.key,
    required this.imgURL,
    required this.name,
    required this.level,
    required this.delete,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(imgURL),
              backgroundColor: Color.fromARGB(255, 28, 27, 27),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(color: Colors.amber, fontSize: 18),
                  ),
                  Text(
                    'Level : $level',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  )
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: IconButton(
              onPressed: () {
                delete();
              },
              icon: Icon(Icons.delete)),
        )
      ],
    );
  }
}
