import 'package:get/get.dart';
import 'package:to_do_list/database/connection.dart';
import 'package:to_do_list/models/taks_model.dart';
import '../../repor/database_repositoty/database_repository.dart';

class HomeController extends GetxController {
  final DataRepository _dataRepository;

  HomeController({required DataRepository dataRepository})
      : _dataRepository = dataRepository;

  final tasks = <TaskModel>[].obs;

  @override
  Future<void> onInit() async {
    getTasks();
    super.onInit();
  }

  Future<void> getTasks() async {
    final result = await _dataRepository.getListTask();
    tasks.assignAll(result);
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
}
