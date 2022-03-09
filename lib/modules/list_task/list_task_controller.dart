import 'package:get/get.dart';
import 'package:to_do_list/modules/Home/home_controller.dart';

class ListTaskController extends GetxController {
  final HomeController _homeController;
  ListTaskController({required HomeController homeController})
      : _homeController = homeController;

  @override
  void onInit() {
    super.onInit();
  }
}
