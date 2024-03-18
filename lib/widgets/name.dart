import "package:flutter/material.dart";

class Name extends StatelessWidget {
  const Name({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/2.jfif"),
              maxRadius: 50,
            ),
          ),
          Divider(
            height: 30,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          Text(
            "NAME",
            style: TextStyle(
                color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            "Aang Li",
            style: TextStyle(
                color: Colors.amber, fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
