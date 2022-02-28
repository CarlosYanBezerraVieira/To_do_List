import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/Shared/values/preferences_key.dart';
import 'package:to_do_list/models/taks_model.dart';

class CreateTaskController extends GetxController {
  final titleController = TextEditingController(text: '');
  final timeController = TextEditingController(text: '');
  final dataController = TextEditingController(text: '');
  final alarmController = TextEditingController(text: '');

  @override
  void onInit() {
    super.onInit();
  }

  void doTask() {
    TaskModel task = TaskModel(
      id: 0,
      title: titleController.text,
      data: dataController.text,
      time: timeController.text,
      alarm: alarmController.text,
      select: true,
    );
    saveTask(task);
  }

  void saveTask(TaskModel taskModel) async {
    SharedPreferences task = await SharedPreferences.getInstance();
    task.setString(PreferencesKey.keytTask, json.encode(taskModel.toJson()));
  }

  Future<TaskModel?> populateTasks() async {
    try {
      TaskModel? savedTask = await getTask();
      return savedTask;
    } catch (e) {
      Exception(e);
      return null;
    }
  }

  Future<TaskModel?> getTask() async {
    SharedPreferences taskSaved = await SharedPreferences.getInstance();
    String? jsonTask = taskSaved.getString(PreferencesKey.keytTask);

    if (jsonTask != null) {
      Map<String, dynamic> mapTask = jsonDecode(json.decode(jsonTask));
      TaskModel task = TaskModel.fromMap(mapTask);

      return task;
    } else {
      Exception("erro ao resgatar as tasks salvas");
    }
  }

  Future<void> deleteTask() async {
    SharedPreferences taskSaved = await SharedPreferences.getInstance();
    taskSaved.clear();
  }
}
