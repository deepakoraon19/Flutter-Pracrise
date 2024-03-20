import 'package:flutter/material.dart';
import 'package:hello/models/mortal.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteService {
  Future<Database> initializeDB() async {
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

  Future<int> create(Mortal obj) async {
    final Database db = await initializeDB();
    final id = await db.insert('mk11', obj.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  Future<List<Mortal>> get() async {
    final db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('mk11');
    return queryResult.map((e) => Mortal.fromMap(e)).toList();
  }

  Future<int> delete(String obj) async {
    final db = await initializeDB();
    final rowsAffected =
        await db.delete('mk11', where: "name = ?", whereArgs: [obj]);
    return rowsAffected;
  }
}
