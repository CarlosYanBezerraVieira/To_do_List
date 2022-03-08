import 'package:get/get.dart';
import 'package:to_do_list/models/taks_model.dart';
import 'package:to_do_list/modules/create_task/create_task_controller.dart';

class HomeController extends GetxController {
  final CreateTaskController _createTaskController;
  HomeController({required CreateTaskController createTaskController})
      : _createTaskController = createTaskController;

  final task = <TaskModel>[].obs;

  @override
  void onInit() {
    getTask();
    super.onInit();
  }

  Future<void> getTask() async {
    try {
      final result = await _createTaskController.populateTasks();
      if (result.isNotEmpty) {
        task.assignAll(result);
      }
    } catch (e) {
      print("erro ao mostra a task");
      Exception(e);
    }
  }
}
