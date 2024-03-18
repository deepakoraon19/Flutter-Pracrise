import 'dart:math';
import 'package:hello/widgets/tiles.dart';
import '../models/mortal.dart';
import "package:flutter/material.dart";

class MortalPedia extends StatefulWidget {
  const MortalPedia({super.key});

  @override
  State<MortalPedia> createState() => _MortalPediaState();
}

class _MortalPediaState extends State<MortalPedia> {
  final List<String> dummyNames = [
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
  List<Mortal> mortals = [];
  List<Widget> tiles = [];

  List<Mortal> getMortals() => dummyNames
      .map((e) => Mortal(e, e, Random().nextInt(100),
          'https://cdn-mk1.mortalkombat.com/roster/${e.toLowerCase()}/thumb.webp'))
      .toList();

  List<Widget> getTiles() {
    return mortals
        .map((e) => Padding(
              padding: const EdgeInsets.fromLTRB(25, 15, 5, 5),
              child: Tiles(imgURL: e.imgUrl, name: e.name, level: e.level),
            ))
        .toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mortals = getMortals();
    tiles = getTiles();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: ListView(
          children: tiles,
        ));
  }
}
