import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/modules/create_task/widgets/body_create/create_body.dart';
import 'package:to_do_list/modules/create_task/widgets/header/header_create_taks.dart';
import './create_task_controller.dart';

class CreateTaskPage extends GetView<CreateTaskController> {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(physics: BouncingScrollPhysics(), children: [
        HeaderCreateTask(),
        BodyCreaTask(),
      ]),
    );
  }
}
