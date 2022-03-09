import 'package:get/get.dart';
import 'package:to_do_list/modules/Home/home_controller.dart';
import 'package:to_do_list/modules/create_task/create_task_controller.dart';

import '../application_controller.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ApplicationController());
    Get.put(CreateTaskController(applicationController: Get.find()),
        permanent: true);
    Get.put(HomeController(createTaskController: Get.find()));
  }
}
