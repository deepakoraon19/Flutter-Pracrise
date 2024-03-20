import "package:flutter/material.dart";
import "package:hello/models/mortal.dart";

class MortalDetail extends StatefulWidget {
  const MortalDetail({super.key});

  @override
  State<MortalDetail> createState() => _MortalDetailState();
}

class _MortalDetailState extends State<MortalDetail> {
  @override
  Widget build(BuildContext context) {
    final mortal = ModalRoute.of(context)!.settings.arguments as Mortal;
    final dummyDetail =
        " is a resurrected ninja in the Mortal Kombat fighting game series as well as the mascot of the games. He is one of the very few original characters debuting in the first Mortal Kombat arcade game. He holds the distinction, along with Raiden and Sub-Zero (in one form or another), of appearing in every generation of Mortal Kombat games as a playable character. Throughout the series, Scorpion has been a misguided antagonist after his resurrection, following those on the side of evil out of revenge and anger over the death of his family and clan. After being restored to his Human form and learning the truth about their demise, he has been a recurring supporting character for the series.";
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 48, 48, 48),
          iconTheme: IconThemeData(color: Colors.white)),
      body: Container(
        // width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(mortal.imgUrl),
                backgroundColor: Color.fromARGB(255, 28, 27, 27),
              ),
            ),
            Text(
              mortal.name,
              style: TextStyle(color: Colors.amber, fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  mortal.clan,
                  style: TextStyle(
                      color: const Color.fromARGB(255, 255, 7, 7),
                      fontSize: 17),
                ),
                Text(
                  '  -  ',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 255, 7, 7),
                      fontSize: 17),
                ),
                Text(
                  'Level ${mortal.level}',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 255, 7, 7),
                      fontSize: 17),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                mortal.details != ''
                    ? mortal.details
                    : '${mortal.name} $dummyDetail',
                style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
