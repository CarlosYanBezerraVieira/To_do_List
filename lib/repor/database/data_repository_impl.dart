import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_list/models/taks_model.dart';

import './data_repository.dart';

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

  @override
  void doTask(TaskModel taskModel) {
    TaskModel task = TaskModel(
      title: taskModel.title,
      datatime: taskModel.datatime,
      time: taskModel.time,
      description: taskModel.description,
      value: 0,
    );

    saveTask(task);
  }

  @override
  Future<void> saveTask(TaskModel taskModel) async {
    try {
      final database = await openConnnection();
      final batch = database.batch();

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
    final database = await openConnnection();
    final result = await database.query('Task');
    final List<TaskModel> listTask =
        result.map((e) => TaskModel.fromMap(e)).toList();
    return listTask;
  }

  @override
  Future<void> delete(int id) async {
    final database = await openConnnection();
    await database.delete('Task', where: 'id = ?', whereArgs: [id]);
  }
}
