import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/Shared/values/date_formatt.dart';
import 'package:to_do_list/models/taks_model.dart';
import 'package:to_do_list/modules/Home/home_controller.dart';
import 'package:to_do_list/repor/database_repositoty/database_repository.dart';

class EdiTaskController extends GetxController {
  final HomeController _homeController;
  final DataRepository _dataRepository;
  EdiTaskController(
      {required HomeController homeController,
      required DataRepository datarepository})
      : _dataRepository = datarepository,
        _homeController = homeController;

  final titleController = TextEditingController(text: '');
  final timeController = TextEditingController(text: '');
  final newtimeController = TextEditingController(text: '');

  final datatimeController = TextEditingController(text: '');
  final newdatatimeController = TextEditingController(text: '');
  final descriptionController = TextEditingController(text: '');
  DateTime date = DateTime.now();
  DateTime hour = DateTime.now();
  late TaskModel task;
  @override
  void onInit() {
    if (Get.arguments is TaskModel) {
      task = Get.arguments;
      titleController.text = task.title ?? "";
      timeController.text = task.time != null ? task.time.toString() : "";
      datatimeController.text =
          task.datatime != null ? task.datatime.toString() : "";
      descriptionController.text = task.description ?? "";
      convertHourToString();
      convertFromDbToInicialvalue();
    } else {
      return Get.back();
    }
    super.onInit();
  }

  void convertHourToString() {
    newtimeController.text =
        DateFormatt().convertHourFromSeconds(int.parse(timeController.text));
  }

  void updateTask() {
    try {
      var id = task.id;
      if (id != null) {
        _dataRepository.update(
            TaskModel(
              title: titleController.text,
              datatime: converteMonthToSeconds(),
              time: converteHourToSeconds(),
              description: descriptionController.text,
              value: task.value,
            ),
            id);
        _homeController.getTasks();
        Get.back();
      }
    } catch (e) {
      print("erro ao editar task");
    }
  }

  void UpdateValueTask(TaskModel taskModel) {
    try {
      final id = taskModel.id;
      if (id != null) {
        _dataRepository.updateValue(id, taskModel.value);
      }
      _homeController.filtrar();
    } catch (e) {
      Exception("erro na hora de muda o valor");
    }
  }

  TimeOfDay convertHourFromDb() {
    final date =
        DateTime.fromMillisecondsSinceEpoch(int.parse(timeController.text));
    return TimeOfDay(hour: date.hour, minute: date.minute);
  }

  int converteHourToSeconds() {
    final timeString = newtimeController.text;
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
    final dateString = newdatatimeController.text.split("-");

    if (dateString != '') {
      return DateTime(int.parse(dateString[0]), int.parse(dateString[1]),
              int.parse(dateString[2]))
          .millisecondsSinceEpoch;
    }
    ;

    return date.millisecondsSinceEpoch;
  }

  void convertFromDbToInicialvalue() {
    final dateSeconds = int.parse(datatimeController.text);
    final dateTime = DateTime.fromMillisecondsSinceEpoch(dateSeconds);
    final dateFormat = DateFormat(
      DateFormat.YEAR_NUM_MONTH_DAY,
    ).format(dateTime);
    final listDates = dateFormat.split("/");
    if (int.parse(listDates[0]) < 10) {
      listDates[0] = "0" + listDates[0];
    }
    if (int.parse(listDates[1]) < 10) {
      listDates[1] = "0" + listDates[1];
    }
    final dateReplace = "${listDates[2]}-${listDates[0]}-${listDates[1]}";

    newdatatimeController.text = dateReplace;
  }
}
