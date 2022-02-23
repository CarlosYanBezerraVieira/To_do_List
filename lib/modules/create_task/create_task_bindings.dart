import 'package:get/get.dart';
import './create_task_controller.dart';

class CreateTaskBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(CreateTaskController());
    }
}