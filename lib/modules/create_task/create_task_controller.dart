import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/models/taks_model.dart';
import 'package:to_do_list/shared/utils/date_formatt.dart';
import '../../repor/database_repositoty/database_repository.dart';

class CreateTaskController extends GetxController {
  final DataRepository _dataRepository;
  final titleController = TextEditingController(text: '');
  final timeController = TextEditingController(text: '');
  final datatimeController = TextEditingController(text: '');
  final descriptionController = TextEditingController(text: '');

  final tasks = <TaskModel>[].obs;
  DateTime date = DateTime.now();

  CreateTaskController({required DataRepository dataRepository})
      : _dataRepository = dataRepository;

  @override
  void onInit() {
    initDates();
    super.onInit();
  }

  void newTask() {
    _dataRepository.doTask(TaskModel(
      title: titleController.text,
      datatime: DateFormatt()
          .converteMonthToSeconds(dateString: datatimeController.text),
      time:
          DateFormatt().converteHourToSeconds(timeString: timeController.text),
      description: descriptionController.text,
      value: 0,
    ));
  }

  initDates() {
    timeController.text = DateFormatt().getHour();

    datatimeController.text = DateTime.now().toString();
  }
}
