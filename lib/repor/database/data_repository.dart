import 'package:sqflite/sqflite.dart';

import '../../models/taks_model.dart';

abstract class DataRepository {
  Future<Database> openConnnection();
  void doTask(TaskModel taskModel);
  void saveTask(TaskModel taskModel);
  void delete(int id);
  Future<List<TaskModel>> getListTask();
}
