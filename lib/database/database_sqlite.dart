import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseSqlite {
  Future<Database> openConnnection() async {
    final databasePath = await getDatabasesPath();
    final databasePathFinal = join(databasePath, "SQLITE_TASKS");
    print(databasePathFinal);
    return openDatabase(databasePathFinal, version: 1, onConfigure: (db) async {
      await db.execute('PRAGMA forein_keys = ON');
    }, onCreate: (Database db, int version) {
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
    },
        onUpgrade: (Database db, int oldVersion, int version) {},
        onDowngrade: (Database db, int oldVersion, int version) {});
  }
}
