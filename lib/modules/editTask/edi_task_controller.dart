import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/models/taks_model.dart';
import 'package:to_do_list/repor/database_repositoty/database_repository.dart';

import '../../shared/utils/date_formatt.dart';

class EdiTaskController extends GetxController {
  final DataRepository _dataRepository;
  EdiTaskController({required DataRepository datarepository})
      : _dataRepository = datarepository;

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
              time: DateFormatt()
                  .converteHourToSeconds(timeString: newtimeController.text),
              description: descriptionController.text,
              value: task.value,
            ),
            id);

        Get.back();
      }
    } catch (e) {
      print("erro ao editar task");
    }
  }

  TimeOfDay convertHourFromDb() {
    final date =
        DateTime.fromMillisecondsSinceEpoch(int.parse(timeController.text));
    return TimeOfDay(hour: date.hour, minute: date.minute);
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
