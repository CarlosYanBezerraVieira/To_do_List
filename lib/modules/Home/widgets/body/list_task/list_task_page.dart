import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/models/taks_model.dart';
import 'package:to_do_list/modules/Home/home_controller.dart';
import 'widget/item_task.dart';

class ListTaskPage extends StatelessWidget {
  const ListTaskPage({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    List<TaskModel> tasks = controller.tasksNotSelect;
    return Material(
      child: Obx(() => Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 30),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ItemTask(
                    model: tasks[index],
                    onPressed: () {
                      Get.toNamed(
                        '/edit',
                        arguments: tasks[index],
                      );
                    },
                    check: () => controller.UpdateValueTask(tasks[index]));
              },
            ),
          )),
    );
  }
}
