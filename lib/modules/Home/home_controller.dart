import 'package:get/get.dart';
import 'package:to_do_list/models/taks_model.dart';

import '../../repor/database/data_repository.dart';

class HomeController extends GetxController {
  final DataRepository _dataRepository;

  HomeController({required DataRepository dataRepository})
      : _dataRepository = dataRepository;

  final tasks = <TaskModel>[].obs;

  @override
  void onInit() {
    getTasks();
    super.onInit();
  }

  Future<void> getTasks() async {
    final result = await _dataRepository.getListTask();
    tasks.assignAll(result);
  }
}
