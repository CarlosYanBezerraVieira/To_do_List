import 'package:get/get.dart';
import 'package:to_do_list/models/taks_model.dart';
import 'package:to_do_list/modules/create_task/create_task_controller.dart';

class HomeController extends GetxController {
  final CreateTaskController _createTaskController;
  HomeController({required CreateTaskController createTaskController})
      : _createTaskController = createTaskController;

  Future<List<TaskModel?>> getTask() async {
    try {
      final List<TaskModel?> showTask =
          await _createTaskController.populateTasks();
      return showTask;
    } catch (e) {
      print("erro ao mostra a task");
      Exception(e);
      return [];
    }
  }
}
