import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/modules/Home/widgets/body/daily/widget/item_daily.dart';
import '../../../../../models/taks_model.dart';
import '../../../../../shared/widgets/bottom_sheet_widget.dart';
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
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                elevation: 8,
                child: Container(
                  height: 90 * controller.size.value,
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
                            onPressed: () async {
                              await BottomSheetWidget().showBottomSheet(
                                model: tasks[index],
                                controller: controller,
                              );
                              controller.isSelected.value = false;
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
