import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:to_do_list/application/application_controller.dart';
import 'package:to_do_list/models/taks_model.dart';

class CreateTaskController extends GetxController {
  final titleController = TextEditingController(text: '');
  final timeController = TextEditingController(text: '');
  final datatimeController = TextEditingController(text: '');
  final descriptionController = TextEditingController(text: '');
  final tasks = <TaskModel>[].obs;
  final ApplicationController _applicationController;
  CreateTaskController({required ApplicationController applicationController})
      : _applicationController = ApplicationController();

  @override
  void onInit() {
    super.onInit();
  }

  void doTask() {
    TaskModel task = TaskModel(
      title: titleController.text,
      datatime: timeController.text.isNotEmpty
          ? int.parse(datatimeController.text)
          : null,
      time: timeController.text.isNotEmpty
          ? int.parse(timeController.text)
          : null,
      description: descriptionController.text,
      value: 1,
    );

    saveTask(task);
  }

  void saveTask(TaskModel? taskModel) async {
    final database = await _applicationController.openData();
    final batch = database.batch();
    if (taskModel != null) {
      batch.insert(
        'Task',
        {
          'title': taskModel.title,
          'datatime': taskModel.datatime,
          'time': taskModel.time,
          'description': taskModel.description,
          'value': taskModel.value == false ? 0 : 1
        },
      );
      batch.commit();
    }
  }

  Future<List<TaskModel>> populateTasks() async {
    try {
      final tasks = await getListTask();
      final rxTasks = <TaskModel>[...tasks ?? []].obs;
      return rxTasks;
    } catch (e) {
      Exception(e);
      return [];
    }
  }

  Future<List<TaskModel>?> getListTask() async {
    final database = await _applicationController.openData();
    final result = await database.query('Task');
    final List<TaskModel> listTask =
        result.map((e) => TaskModel.fromMap(e)).toList();
    return listTask;
  }

  // Future<void> deleteTask() async {
  //   SharedPreferences taskSaved = await SharedPreferences.getInstance();
  //   taskSaved.clear();
  // }

}
