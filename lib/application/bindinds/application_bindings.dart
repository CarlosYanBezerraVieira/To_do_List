import 'package:get/get.dart';
import 'package:to_do_list/modules/Home/home_controller.dart';
import '../../repor/database_repositoty/database_repository.dart';
import '../../repor/database_repositoty/database_repository_impl.dart';
import '../application_controller.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ApplicationController(), permanent: true);
    Get.lazyPut<DataRepository>(() => DataRepositoryImpl(), fenix: true);
    Get.put(HomeController(dataRepository: Get.find()));
  }
}
