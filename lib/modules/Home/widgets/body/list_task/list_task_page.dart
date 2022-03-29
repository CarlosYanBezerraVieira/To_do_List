import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:to_do_list/models/taks_model.dart';
import 'package:to_do_list/modules/Home/home_controller.dart';
import '../../../../../Shared/values/icons_svg.dart';
import '../../../../../Shared/widget/item_form.dart';
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
                      Get.bottomSheet(
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Visibility(
                                      visible: tasks[index].time != null,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                IconsSvg.iconCalendar),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: Text(
                                                tasks[index]
                                                    .datatime
                                                    .toString(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: tasks[index].time != null,
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(IconsSvg.iconTime),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              tasks[index].time.toString(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Obx(() => Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  Get.toNamed(
                                                    '/edit',
                                                    arguments: tasks[index],
                                                  );
                                                },
                                                icon: AnimatedSwitcher(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  child: controller
                                                          .isSelected.value
                                                      ? const Icon(
                                                          Icons.edit,
                                                          color: Colors.purple,
                                                          key:
                                                              ValueKey('IconA'),
                                                        )
                                                      : null,
                                                  transitionBuilder:
                                                      (Widget child,
                                                          Animation<double>
                                                              animation) {
                                                    return ScaleTransition(
                                                        child: child,
                                                        scale: animation);
                                                  },
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  controller
                                                      .deleteTask(tasks[index]);
                                                },
                                                icon: AnimatedSwitcher(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  child: controller
                                                          .isSelected.value
                                                      ? const Icon(
                                                          Icons.delete,
                                                          color: Colors.purple,
                                                          key:
                                                              ValueKey('IconA'),
                                                        )
                                                      : null,
                                                  transitionBuilder:
                                                      (Widget child,
                                                          Animation<double>
                                                              animation) {
                                                    return ScaleTransition(
                                                        child: child,
                                                        scale: animation);
                                                  },
                                                ),
                                              ),
                                              IconButton(
                                                onPressed:
                                                    controller.toggleAnimation,
                                                icon: AnimatedSwitcher(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  child: controller
                                                          .isSelected.value
                                                      ? const Icon(
                                                          Icons.close,
                                                          color: Colors.purple,
                                                          key:
                                                              ValueKey('IconA'),
                                                        )
                                                      : const Icon(
                                                          Icons
                                                              .more_vert_rounded,
                                                          color: Colors.purple,
                                                          key:
                                                              ValueKey('IconB'),
                                                        ),
                                                  transitionBuilder:
                                                      (Widget child,
                                                          Animation<double>
                                                              animation) {
                                                    return ScaleTransition(
                                                        child: child,
                                                        scale: animation);
                                                  },
                                                ),
                                              ),
                                            ],
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 15)
                                    .copyWith(top: 0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.grey, width: 2)),
                                child: ItemForm(
                                  initialValue: tasks[index].title,
                                  enabled: false,
                                  icons: IconsSvg.iconTitle,
                                  label: "Titulo",
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.grey, width: 2)),
                                child: ItemForm(
                                  initialValue: tasks[index].description,
                                  enabled: false,
                                  label: "Descrição",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    check: () => controller.UpdateValueTask(tasks[index]));
              },
            ),
          )),
    );
  }
}
