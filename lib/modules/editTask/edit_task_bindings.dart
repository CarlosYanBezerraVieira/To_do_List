import 'package:get/get.dart';
import 'package:to_do_list/modules/editTask/edi_task_controller.dart';

class EditTaskBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(EdiTaskController(
      datarepository: Get.find(),
      homeController: Get.find(),
    ));
  }
}
