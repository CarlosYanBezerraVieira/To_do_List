import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/modules/Home/widgets/body/daily/widget/item_daily.dart';

import '../../../../../Shared/values/icons_svg.dart';
import '../../../../../Shared/widget/item_form.dart';
import '../../../../../models/taks_model.dart';
import '../../../home_controller.dart';

class Daily extends StatelessWidget {
  Daily({Key? key, required this.controller}) : super(key: key);
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    List<TaskModel> tasks = controller.tasksSelect;

    return Obx(() => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Colors.transparent,
                elevation: 10,
                child: Container(
                  height: Get.height * controller.size.value,
                  width: Get.width * 0.875,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        colors: [
                          Color(0xff7F00FF),
                          Color(0xffE100FF),
                        ],
                      )),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return ItemDaily(
                        model: tasks[index],
                        onPressed: () {
                          showDialog(
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            controller.deleteTask(tasks[index]);
                                          },
                                          icon: Icon(Icons.delete)),
                                      IconButton(
                                          onPressed: () => controller
                                              .updateTask(tasks[index]),
                                          icon: Icon(Icons.create)),
                                    ],
                                  ),
                                ],
                                contentPadding: EdgeInsets.all(0),
                                content: Container(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: IconButton(
                                            onPressed: () => Get.back(),
                                            icon: Icon(Icons.close)),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
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
                ),
              ),
            ),
          ],
        ));
  }
}
