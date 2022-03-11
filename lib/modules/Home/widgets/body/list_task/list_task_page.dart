import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/Shared/values/icons_svg.dart';
import 'package:to_do_list/Shared/widget/item_form.dart';
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
    return Obx(() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 30),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return ItemTask(
                model: tasks[index],
                onPressed: () {
                  showDialog(
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    controller.deleteTask(tasks[index]);
                                  },
                                  icon: Icon(Icons.delete)),
                              IconButton(
                                  onPressed: () =>
                                      controller.updateTask(tasks[index]),
                                  icon: Icon(Icons.create)),
                            ],
                          ),
                        ],
                        contentPadding: EdgeInsets.all(0),
                        content: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: IconButton(
                                    onPressed: () => Get.back(),
                                    icon: Icon(Icons.close)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    ItemForm(
                                      enabled: false,
                                      icons: IconsSvg.iconTitle,
                                      label: "Titulo",
                                    ),
                                    ItemForm(
                                      enabled: false,
                                      icons: IconsSvg.iconCalendar,
                                      label: "Data",
                                    ),
                                    ItemForm(
                                      enabled: false,
                                      icons: IconsSvg.iconTime,
                                      label: "Time",
                                    ),
                                    ItemForm(
                                      enabled: false,
                                      label: "Description",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    context: context,
                  );
                },
              );
            },
          ),
        ));
  }
}
