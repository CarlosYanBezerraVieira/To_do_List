import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:to_do_list/modules/Home/home_controller.dart';

import '../../models/taks_model.dart';
import '../utils/date_formatt.dart';
import '../utils/icons_svg.dart';
import 'item_form.dart';

class BottomSheetWidget {
  showBottomSheet(
      {required TaskModel model, required HomeController controller}) {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 50,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFFC4C4C4)),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: model.datatime != null,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          SvgPicture.asset(IconsSvg.iconCalendar),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(DateFormatt()
                                .convertMonthFromSeconds(model.datatime ?? 0)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: model.time != null,
                    child: Row(
                      children: [
                        SvgPicture.asset(IconsSvg.iconTime),
                        Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(DateFormatt().convertHourFromSeconds(
                              model.time ?? 0,
                            ))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Obx(() => Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.back();
                                Get.toNamed(
                                  '/edit',
                                  arguments: model,
                                );
                              },
                              icon: AnimatedSwitcher(
                                duration: Duration(milliseconds: 300),
                                child: controller.isSelected.value
                                    ? SizedBox(
                                        child: SvgPicture.asset(
                                        IconsSvg.iconEdit,
                                        key: ValueKey('IconA'),
                                      ))
                                    : null,
                                transitionBuilder: (Widget child,
                                    Animation<double> animation) {
                                  return ScaleTransition(
                                      child: child, scale: animation);
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.deleteTask(model);
                              },
                              icon: AnimatedSwitcher(
                                duration: Duration(milliseconds: 300),
                                child: controller.isSelected.value
                                    ? SizedBox(
                                        child: SvgPicture.asset(
                                        IconsSvg.iconDelete,
                                        key: ValueKey('IconA'),
                                      ))
                                    : null,
                                transitionBuilder: (Widget child,
                                    Animation<double> animation) {
                                  return ScaleTransition(
                                      child: child, scale: animation);
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: controller.toggleAnimation,
                              icon: AnimatedSwitcher(
                                duration: Duration(milliseconds: 300),
                                child: controller.isSelected.value
                                    ? SizedBox(
                                        child: SvgPicture.asset(
                                        IconsSvg.iconClose,
                                        key: ValueKey('IconA'),
                                      ))
                                    : const Icon(
                                        Icons.more_vert_rounded,
                                        color: Colors.purple,
                                        size: 30,
                                        key: ValueKey('IconB'),
                                      ),
                                transitionBuilder: (Widget child,
                                    Animation<double> animation) {
                                  return ScaleTransition(
                                      child: child, scale: animation);
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
              margin: EdgeInsets.symmetric(horizontal: 15).copyWith(top: 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.purple, width: 2)),
              child: ItemForm(
                initialValue: model.title,
                enabled: false,
                icons: IconsSvg.iconTitle,
                label: "Titulo",
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.purple, width: 2)),
              child: ItemForm(
                initialValue: model.description,
                enabled: false,
                label: "Descrição",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
