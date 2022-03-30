import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:to_do_list/models/taks_model.dart';
import 'package:to_do_list/modules/Home/home_controller.dart';
import '../../repor/database_repositoty/database_repository.dart';

class CreateTaskController extends GetxController {
  final DataRepository _dataRepository;
  final HomeController _homeController;
  final titleController = TextEditingController(text: '');
  final timeController = TextEditingController(text: '');
  final datatimeController = TextEditingController(text: '');
  final descriptionController = TextEditingController(text: '');
  final tasks = <TaskModel>[].obs;

  CreateTaskController(
      {required HomeController homeController,
      required DataRepository dataRepository})
      : _homeController = homeController,
        _dataRepository = dataRepository;

  @override
  void onClose() {
    //gambiara momentanea
    _homeController.getTasks();
    super.onClose();
  }

  void newTask() {
    _dataRepository.doTask(TaskModel(
      title: titleController.text,
      datatime: datatimeController.text,
      time: timeController.text,
      description: descriptionController.text,
      value: 0,
    ));
  }
}
