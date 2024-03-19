import 'package:flutter/material.dart';
import 'package:hello/models/mortal.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteService {
  Future<Database> initializeDB() async {
    // Database db = await openDatabase(
    //   join(await getDatabasesPath(), 'test.db'),
    //   onCreate: (db, version) {
    //     return db.execute("DROP TABLE IF EXISTS tableName");
    //   },
    //   version: 1,
    // );
    final _directory = await getDatabasesPath();
    String dbPath = join(_directory, 'test.db');

    debugPrint(dbPath);
    return openDatabase(
      join(await getDatabasesPath(), 'test.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE IF NOT EXISTS mk11 (name TEXT NOT NULL, clan TEXT NOT NULL, level INTEGER NOT NULL, imgURL TEXT NOT NULL)',
        );
      },
      version: 1,
    );
  }

  Future<int> createItem(Mortal obj) async {
    final Database db = await initializeDB();
    final id = await db.insert('mk11', obj.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  Future<List<Mortal>> getItems() async {
    final db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('mk11');
    return queryResult.map((e) => Mortal.fromMap(e)).toList();
  }
}
