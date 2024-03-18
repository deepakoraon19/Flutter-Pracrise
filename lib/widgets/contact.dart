import "package:flutter/material.dart";

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Icon(
            Icons.mail,
            size: 20,
            color: Colors.white,
          ),
          Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "xyz@gmail.com",
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
