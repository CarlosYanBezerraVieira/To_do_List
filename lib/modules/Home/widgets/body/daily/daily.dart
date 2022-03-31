import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:to_do_list/modules/Home/widgets/body/daily/widget/item_daily.dart';
import '../../../../../Shared/values/icons_svg.dart';
import '../../../../../Shared/widget/item_form.dart';
import '../../../../../models/taks_model.dart';
import '../../../home_controller.dart';

class Daily extends StatelessWidget {
  Daily({Key? key, required this.controller, this.onPressed}) : super(key: key);
  final HomeController controller;
  final Function()? onPressed;
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
                  width: Get.width * 0.87,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        colors: [
                          Color(0xff7F00FF),
                          Color(0xff7F00FF),
                          Color(0xff8C00FF),
                          Color(0xff8C00FF),
                          Color(0xffB000FF),
                          Color(0xffE100FF),
                        ],
                      )),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: onPressed,
                        child: ItemDaily(
                            model: tasks[index],
                            onPressed: () {
                              Get.bottomSheet(
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          width: 50,
                                          height: 4,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: const Color(0xFFC4C4C4)),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Visibility(
                                              visible: tasks[index]
                                                  .datatime!
                                                  .isNotEmpty,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        IconsSvg.iconCalendar),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
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
                                              visible:
                                                  tasks[index].time!.isNotEmpty,
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      IconsSvg.iconTime),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5),
                                                    child: Text(
                                                      tasks[index]
                                                          .time
                                                          .toString(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Obx(() => Row(
                                                    children: [
                                                      IconButton(
                                                        onPressed: () {
                                                          Get.toNamed(
                                                            '/edit',
                                                            arguments:
                                                                tasks[index],
                                                          );
                                                        },
                                                        icon: AnimatedSwitcher(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          child: controller
                                                                  .isSelected
                                                                  .value
                                                              ? const Icon(
                                                                  Icons.edit,
                                                                  color: Colors
                                                                      .purple,
                                                                  key: ValueKey(
                                                                      'IconA'),
                                                                )
                                                              : null,
                                                          transitionBuilder:
                                                              (Widget child,
                                                                  Animation<
                                                                          double>
                                                                      animation) {
                                                            return ScaleTransition(
                                                                child: child,
                                                                scale:
                                                                    animation);
                                                          },
                                                        ),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          controller.deleteTask(
                                                              tasks[index]);
                                                        },
                                                        icon: AnimatedSwitcher(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          child: controller
                                                                  .isSelected
                                                                  .value
                                                              ? SizedBox(
                                                                  child:
                                                                      SvgPicture
                                                                          .asset(
                                                                  IconsSvg
                                                                      .iconDelete,
                                                                  key: ValueKey(
                                                                      'IconA'),
                                                                ))
                                                              : null,
                                                          transitionBuilder:
                                                              (Widget child,
                                                                  Animation<
                                                                          double>
                                                                      animation) {
                                                            return ScaleTransition(
                                                                child: child,
                                                                scale:
                                                                    animation);
                                                          },
                                                        ),
                                                      ),
                                                      IconButton(
                                                        onPressed: controller
                                                            .toggleAnimation,
                                                        icon: AnimatedSwitcher(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          child: controller
                                                                  .isSelected
                                                                  .value
                                                              ? SizedBox(
                                                                  child:
                                                                      SvgPicture
                                                                          .asset(
                                                                  IconsSvg
                                                                      .iconClose,
                                                                  key: ValueKey(
                                                                      'IconA'),
                                                                ))
                                                              : const Icon(
                                                                  Icons
                                                                      .more_vert_rounded,
                                                                  color: Colors
                                                                      .purple,
                                                                  size: 30,
                                                                  key: ValueKey(
                                                                      'IconB'),
                                                                ),
                                                          transitionBuilder:
                                                              (Widget child,
                                                                  Animation<
                                                                          double>
                                                                      animation) {
                                                            return ScaleTransition(
                                                                child: child,
                                                                scale:
                                                                    animation);
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
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 15)
                                                .copyWith(top: 0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Colors.purple,
                                                width: 2)),
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
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Colors.purple,
                                                width: 2)),
                                        child: ItemForm(
                                          initialValue:
                                              tasks[index].description,
                                          enabled: false,
                                          label: "Descrição",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            check: () =>
                                controller.UpdateValueTask(tasks[index])),
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
