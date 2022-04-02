import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_list/database/connection.dart';
import 'package:to_do_list/models/taks_model.dart';

import 'database_repository.dart';

class DataRepositoryImpl implements DataRepository {
  @override
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
          datatime INTEGER,
          time INTEGER,
          description text,
          value integer
          ) 
        ''');

      batch.commit();
    },
        onUpgrade: (Database db, int oldVersion, int version) {},
        onDowngrade: (Database db, int oldVersion, int version) {});
  }

  @override
  void doTask(TaskModel taskModel) {
    TaskModel task = TaskModel(
      title: taskModel.title,
      datatime: taskModel.datatime,
      time: taskModel.time,
      description: taskModel.description,
      value: taskModel.value,
    );

    saveTask(task);
  }

  @override
  Future<void> saveTask(TaskModel taskModel) async {
    try {
      final db = await Connection.instance.db;
      final batch = db!.batch();

      batch.insert(
        'Task',
        {
          'title': taskModel.title,
          'datatime': taskModel.datatime,
          'time': taskModel.time,
          'description': taskModel.description,
          'value': taskModel.value
        },
      );
      batch.commit();
    } catch (e) {
      Exception(e);
      print("erro ao salvar a task");
    }
  }

  @override
  Future<List<TaskModel>> getListTask() async {
    final db = await Connection.instance.db;
    final result = await db!.query('Task');
    final List<TaskModel> listTask =
        result.map((e) => TaskModel.fromMap(e)).toList();
    return listTask;
  }

  @override
  Future<void> delete(int id) async {
    final db = await Connection.instance.db;
    await db!.delete('Task', where: 'id = ?', whereArgs: [id]);
    getListTask();
  }

  @override
  Future<void> update(TaskModel taskModel, int id) async {
    final db = await Connection.instance.db;

    db!.update(
        'Task',
        {
          'title': taskModel.title,
          'datatime': taskModel.datatime,
          'time': taskModel.time,
          'description': taskModel.description,
          'value': taskModel.value
        },
        where: 'id = ?',
        whereArgs: [id]);
  }

  @override
  Future<void> updateValue(int id, int value) async {
    final db = await Connection.instance.db;
    db!.update('Task', {'value': value}, where: 'id = ?', whereArgs: [id]);
  }
}
