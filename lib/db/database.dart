import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider {
  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'spending_tracker_database.db');

    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE Payments (id INTEGER PRIMARY KEY, detail TEXT, date DATE, amount REAL)');
        await db.execute('CREATE TABLE Bucket (id INTEGER PRIMARY KEY, name TEXT, currency TEXT, amount REAL)');
        await db.execute("INSERT INTO Bucket (name, currency, amount) values ('Cash', 'AR\$', 0.0)");
      },
    );

    return database;
  }
}
