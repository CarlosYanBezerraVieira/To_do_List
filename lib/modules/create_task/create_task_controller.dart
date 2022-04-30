import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/models/taks_model.dart';
import 'package:to_do_list/modules/Home/home_controller.dart';
import '../../repor/database_repositoty/database_repository.dart';

class CreateTaskController extends GetxController {
  final DataRepository _dataRepository;
  final HomeController _homeController;
  final titleController = TextEditingController(text: '');
  final timeController = TextEditingController(text: '');
  final datatimeController = TextEditingController(text: '');
  final descriptionController = TextEditingController(text: '');
  final tasks = <TaskModel>[].obs;
  DateTime date = DateTime.now();
  DateTime hour = DateTime.now();
  CreateTaskController(
      {required HomeController homeController,
      required DataRepository dataRepository})
      : _homeController = homeController,
        _dataRepository = dataRepository;

  @override
  void onClose() {
    //gambiara momentanea
    _homeController.getTasks();
    super.onClose();
  }

  @override
  void onInit() {
    initDates();
    super.onInit();
  }

  void newTask() {
    _dataRepository.doTask(TaskModel(
      title: titleController.text,
      datatime: converteMonthToSeconds(),
      time: converteHourToSeconds(),
      description: descriptionController.text,
      value: 0,
    ));
  }

  int converteHourToSeconds() {
    final timeString = timeController.text;
    if (timeString != "") {
      List<String> timeSplit = timeString.split(':');
      var clock = int.tryParse(timeSplit[0]);
      var minute = int.tryParse(timeSplit[1]);
      var dateWithoutTime = DateTime(date.year, date.month, date.day);
      if (clock != null && minute != null) {
        clock = clock * 60 * 60 * 1000;
        minute = minute * 60 * 1000;
        var clockTotalinSeconds =
            (clock + minute + dateWithoutTime.millisecondsSinceEpoch);

        return clockTotalinSeconds;
      }
    }

    return hour.millisecondsSinceEpoch;
  }

  int converteMonthToSeconds() {
    final dateString = datatimeController.text;

    if (dateString != '') {
      return DateTime.parse(dateString).millisecondsSinceEpoch;
    }
    ;

    return date.millisecondsSinceEpoch;
  }

  initDates() {
    timeController.text = TimeOfDay.now().toString();
    datatimeController.text = DateTime.now().toString();
  }
}
