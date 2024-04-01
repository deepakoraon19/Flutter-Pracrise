import 'package:hello/models/todo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ToDoService {
  Future<Database> initializeDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'test.db'),
      onCreate: (db, version) {
        db.execute('''CREATE TABLE IF NOT EXISTS Users (
    userId INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    userName TEXT,
    password TEXT,
    dateOfBirth DATETIME,
    profilePic TEXT,
    lastUpdatedBy TEXT,
    lastUpdatedOn TEXT
);

CREATE TABLE IF NOT EXISTS TODO (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    userId INTEGER,
    title TEXT,
    lastUpdatedOn TEXT,
    description TEXT,
    FOREIGN KEY (userId) REFERENCES Users(userId)
);
''');
        var x = "";
      },
      version: 1,
    );
  }

  Future<int> create(ToDoItem obj) async {
    final Database db = await initializeDB();
    final id = await db.insert('TODO', obj.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  Future<List<ToDoItem>> get() async {
    final db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('TODO');
    return queryResult.map((e) => ToDoItem.fromMap(e)).toList();
  }

  Future<int> delete(String obj) async {
    final db = await initializeDB();
    final rowsAffected =
        await db.delete('TODO', where: "id = ?", whereArgs: [obj]);
    return rowsAffected;
  }
}
