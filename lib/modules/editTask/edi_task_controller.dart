import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
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
      //passar dados pros controlles
    } else {
      return Get.back();
    }
    super.onInit();
  }

  void updateTask(TaskModel taskModel) {
    try {
      _dataRepository.update(taskModel);

      _homeController.getTasks();
      _homeController.filtrar();
      Get.back();
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
