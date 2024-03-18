import 'package:flutter/material.dart';
import 'package:hello/widgets/basicInfo.dart';
import 'package:hello/widgets/contact.dart';
import 'package:hello/widgets/name.dart';
import 'package:hello/widgets/tiles.dart';

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
        body: Card(),
        floatingActionButton: FloatingActionButton(
            onPressed: () => {}, shape: CircleBorder(), child: Text('+')),
      ),
    );
  }
}

class Card extends StatefulWidget {
  const Card({super.key});

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  List<String> names = [
    'Ashrah',
    'Baraka',
    'Geras',
    'Havik',
    'Johnny-Cage',
    'Kitana',
    'Kung-lao',
    'Li-Mei',
    'Liu-Kang',
    'Mileena',
    'Omni-Man',
    'Peacemaker',
    'Quan-Chi',
    'Raiden',
    'Rain',
    'Reptile',
    'Scorpion',
    'Shang-Tsung',
    'Smoke',
    'Sub-Zero',
    'Tanya'
  ];

  List<Widget> GetTiles() {
    List<Widget> tiles = [];
    names.forEach((element) {
      tiles.add(Padding(
        padding: const EdgeInsets.fromLTRB(25, 15, 5, 5),
        child: Tiles(
            imgURL:
                'https://cdn-mk1.mortalkombat.com/roster/${element.toLowerCase()}/thumb.webp',
            name: element),
      ));
    });
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        color: Colors.black,
        child: ListView(
          children: [...GetTiles()],
        )
        //  Column(children: [Name(), BasicInfo(level: lvl), Contact()])
        );
  }
}
