import 'package:get/get.dart';

import '../repor/database/data_repository_impl.dart';

class ApplicationController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
    DataRepositoryImpl().openConnnection();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
