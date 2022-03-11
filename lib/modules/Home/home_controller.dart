import 'package:get/get.dart';
import 'package:to_do_list/models/taks_model.dart';
import '../../repor/database_repositoty/database_repository.dart';

class HomeController extends GetxController {
  final DataRepository _dataRepository;

  HomeController({required DataRepository dataRepository})
      : _dataRepository = dataRepository;

  final tasks = <TaskModel>[].obs;
  final tasksSelect = <TaskModel>[].obs;
  final tasksNotSelect = <TaskModel>[].obs;

  List<TaskModel> listNotSelect = [];
  List<TaskModel> listSelect = [];

  var size = 0.0.obs;

  @override
  Future<void> onInit() async {
    getTasks();
    super.onInit();
  }

  Future<void> getTasks() async {
    final result = await _dataRepository.getListTask();
    tasks.assignAll(result);
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

  void updateTask(TaskModel taskModel) {
    try {
      _dataRepository.update(taskModel);
      getTasks();
      Get.back();
    } catch (e) {
      print("erro ao editar task");
    }
  }

  void filtrar() {
    tasks.removeWhere((task) {
      if (task.value == 0) {
        listNotSelect.add(task);
        tasksNotSelect.assignAll(listNotSelect);

        return true;
      } else {
        listSelect.add(task);
        tasksSelect.assignAll(listSelect);
        size.value = tasksSelect.length * 0.115;
        return false;
      }
    });
    listNotSelect = [];
    listSelect = [];
  }
}
