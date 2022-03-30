import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/models/taks_model.dart';
import 'package:to_do_list/modules/Home/home_controller.dart';
import 'package:to_do_list/repor/database_repositoty/database_repository.dart';

class EdiTaskController extends GetxController {
  final HomeController _homeController;
  final DataRepository _dataRepository;
  EdiTaskController(
      {required HomeController homeController,
      required DataRepository datarepository})
      : _dataRepository = datarepository,
        _homeController = homeController;

  final titleController = TextEditingController(text: '');
  final timeController = TextEditingController(text: '');
  final datatimeController = TextEditingController(text: '');
  final descriptionController = TextEditingController(text: '');

  late TaskModel task;
  @override
  void onInit() {
    if (Get.arguments is TaskModel) {
      task = Get.arguments;
      titleController.text = task.title ?? "";
      timeController.text = task.time != null ? task.time.toString() : "";
      datatimeController.text =
          task.datatime != null ? task.datatime.toString() : "";
      descriptionController.text = task.description ?? "";

      //passar dados pros controlles
    } else {
      return Get.back();
    }
    super.onInit();
  }

  void updateTask() {
    try {
      var id = task.id;
      if (id != null) {
        _dataRepository.update(
            TaskModel(
              title: titleController.text,
              datatime: datatimeController.text,
              time: timeController.text,
              description: descriptionController.text,
              value: task.value,
            ),
            id);
        _homeController.getTasks();
        Get.back();
      }
    } catch (e) {
      print("erro ao editar task");
    }
  }

  void UpdateValueTask(TaskModel taskModel) {
    try {
      final id = taskModel.id;
      if (id != null) {
        _dataRepository.updateValue(id, taskModel.value);
      }
      _homeController.filtrar();
    } catch (e) {
      Exception("erro na hora de muda o valor");
    }
  }
}
