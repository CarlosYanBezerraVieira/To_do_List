import 'package:get/get.dart';
import './list_task_controller.dart';

class ListTaskBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ListTaskController(homeController: Get.find()));
  }
}
