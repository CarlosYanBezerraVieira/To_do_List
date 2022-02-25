import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/models/taks_model.dart';

class CreateTaskController extends GetxController {
  final titleController = TextEditingController(text: '');
  final timeController = TextEditingController(text: '');
  final dataController = TextEditingController(text: '');
  final alarmController = TextEditingController(text: '');

  static final keytTask = "keytTask";
  @override
  void onInit() {
    super.onInit();
  }
}
