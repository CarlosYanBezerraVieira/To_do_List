import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:to_do_list/models/taks_model.dart';
import '../../repor/database_repositoty/database_repository.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  final DataRepository _dataRepository;

  HomeController({required DataRepository dataRepository})
      : _dataRepository = dataRepository;

  final tasks = <TaskModel>[].obs;
  final tasksSelect = <TaskModel>[].obs;
  final tasksNotSelect = <TaskModel>[].obs;
  final isSelected = false.obs;
  late AnimationController animation;
  List<TaskModel> listNotSelect = [];
  List<TaskModel> listSelect = [];

  var size = 0.0.obs;
  var sizeTask = 0.obs;
  var sizeTaskSelect = 0.obs;

  @override
  Future<void> onInit() async {
    animation =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    getTasks();
    super.onInit();
  }

  void toggleAnimation() {
    isSelected.toggle();
  }

  Future<void> getTasks() async {
    final result = await _dataRepository.getListTask();
    tasks.assignAll(result);
    sizeTask.value = tasks.length;
    filtrar();
  }

  void deleteTask(TaskModel taskModel) {
    final id = taskModel.id;
    if (id != null) {
      _dataRepository.delete(id);
      getTasks();
      Get.back();
    } else {
      print("erro ao deletar");
    }
  }

  void filtrar() {
    tasks.removeWhere((task) {
      if (task.value == 0) {
        listNotSelect.add(task);

        return true;
      } else {
        listSelect.add(task);
        tasksSelect.assignAll(listSelect);

        return false;
      }
    });

    tasksNotSelect.assignAll(listNotSelect);
    tasksSelect.assignAll(listSelect);
    sizeTaskSelect.value = tasksSelect.length;
    size.value = tasksSelect.length * 0.115;
    listNotSelect = [];
    listSelect = [];
  }

  void UpdateValueTask(TaskModel taskModel) {
    try {
      final id = taskModel.id;
      final value;
      if (taskModel.value == 0) {
        value = 1;
      } else {
        value = 0;
      }
      if (id != null) {
        _dataRepository.updateValue(id, value);
      }

      filtrar();
      getTasks();
    } catch (e) {
      Exception("erro na hora de muda o valor");
    }
  }
}
