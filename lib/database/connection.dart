import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static const int _version = 1;

  static const String _nameDatabase = "SQLITE_TASKS";
  Database? _db;

  static late Connection _instance;
  Connection._internal();

  static Connection get instance {
    _instance = Connection._internal();
    return _instance;
  }

  Future<Database?> get db => _openConnection();

  Future<Database?> _openConnection() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, _nameDatabase);
    if (_db == null) {
      _db =
          await openDatabase(path, version: _version, onConfigure: (db) async {
        await db.execute('PRAGMA forein_keys = ON');
      }, onCreate: _onCreate, onUpgrade: _onUpgrade, onDowngrade: _onDowngrade);
      return _db;
    } else {
      return null;
    }
  }

  FutureOr<void> _onCreate(Database db, int version) {
    print("banco criado");
    final batch = db.batch();
    batch.execute('''
        create table Task(
          id Integer primary key autoincrement,
          title text,
          datatime num,
          time num,
          description text,
          value integer
          ) 
        ''');

    batch.commit();
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) {}

  FutureOr<void> _onDowngrade(Database db, int oldVersion, int newVersion) {}

  closeConnection() {
    _db?.close() ?? print("banco é nullo");
    _db = null;
  }
}
