import 'dart:io';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:hello/services/sql_service.dart';
import 'package:hello/widgets/tiles.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/mortal.dart';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

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
  final nameController = TextEditingController();
  final clanController = TextEditingController();
  final levelController = TextEditingController();
  final detailController = TextEditingController();
  late SqliteService _sqliteService = SqliteService();

  final testImageURL =
      "https://cdn.vectorstock.com/i/500p/63/36/freddie-mercury-logo-avatar-monochrome-style-vector-26516336.avif";
  List<Mortal> getMortals() => dummyNames
      .map((e) => Mortal(
          e,
          e,
          Random().nextInt(100),
          'https://cdn-mk1.mortalkombat.com/roster/${e.toLowerCase()}/thumb.webp',
          ""))
      .toList();

  List<Widget> getTiles() {
    return mortals
        .map((e) => Padding(
              padding: const EdgeInsets.fromLTRB(25, 15, 5, 5),
              child: Tiles(
                  mortal: e,
                  delete: () async {
                    await _sqliteService.delete(e.name);
                    final res = await _sqliteService.get();
                    setState(() {
                      mortals = [];
                      res.forEach((e) => mortals.add(e));
                      tiles = getTiles();
                    });
                  }),
            ))
        .toList();
  }

  Future<void> get() async {
    try {
      final res = await _sqliteService.get();
      setState(() {
        mortals = [];
        res.forEach((e) => mortals.add(e));
        tiles = getTiles();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    mortals = getMortals();
    tiles = getTiles();
    get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.black,
          child: ListView(
            children: tiles,
          )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Add character'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: InputDecoration(hintText: "Name"),
                        controller: nameController,
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: "Clan"),
                        controller: clanController,
                      ),
                      TextField(
                          decoration: InputDecoration(hintText: "Level"),
                          controller: levelController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ]),
                      TextField(
                        decoration: InputDecoration(hintText: "Details"),
                        keyboardType: TextInputType.multiline,
                        controller: detailController,
                        minLines: 4,
                        maxLines: 10,
                      )
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        resetFields();
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Submit'),
                      onPressed: () async {
                        _sqliteService.create(Mortal(
                            nameController.text,
                            clanController.text,
                            int.parse(levelController.text),
                            testImageURL,
                            ""));
                        resetFields();
                        await get();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          shape: CircleBorder(),
          backgroundColor: const Color.fromARGB(255, 55, 54, 54),
          child: Text(
            '+',
            style: TextStyle(fontSize: 25, color: Colors.amber),
          )),
    );
  }

  void resetFields() {
    nameController.clear();
    levelController.clear();
    detailController.clear();
    clanController.clear();
  }
}
