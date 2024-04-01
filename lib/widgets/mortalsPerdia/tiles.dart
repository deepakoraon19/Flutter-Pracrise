import "package:flutter/material.dart";
import "package:hello/models/mortal.dart";

class Tiles extends StatelessWidget {
  final Mortal mortal;
  final delete;
  const Tiles({
    super.key,
    required this.mortal,
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
              backgroundImage: NetworkImage(mortal.imgUrl),
              backgroundColor: Color.fromARGB(255, 28, 27, 27),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/details", arguments: mortal);
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mortal.name,
                      style: TextStyle(color: Colors.amber, fontSize: 18),
                    ),
                    Text(
                      'Level : ${mortal.level}',
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    )
                  ],
                ),
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
