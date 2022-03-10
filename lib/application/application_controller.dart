import 'package:get/get.dart';
import 'package:to_do_list/database/connection.dart';

class ApplicationController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    Connection.instance.closeConnection();
    super.onClose();
  }
}
