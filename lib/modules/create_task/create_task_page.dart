import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './create_task_controller.dart';
import 'widgets/body_create/create_body.dart';
import 'widgets/header/header_create_taks.dart';

class CreateTaskPage extends GetView<CreateTaskController> {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HeaderCreateTask(),
              BodyCreaTask(),
            ],
          ),
        ));
  }
}
