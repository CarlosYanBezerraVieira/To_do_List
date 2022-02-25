import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/modules/create_task/create_task_controller.dart';
import 'package:to_do_list/modules/create_task/widgets/header/item_form.dart';

class BodyCreaTask extends GetView<CreateTaskController> {
  const BodyCreaTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List icons = [
      "assets/images/icon/svg_icons/task.svg",
      "assets/images/icon/svg_icons/date.svg",
      "assets/images/icon/svg_icons/time.svg",
      "assets/images/icon/svg_icons/time2.svg",
    ];
    List label = [
      "Type here",
      "05 June 2021",
      "12.00 AM",
      "30 minutes before (switch)"
    ];
    List title = ["Task title", "Date", "Time", "Alarm"];
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
        child: Column(
          children: [
            ItemForm(
              controller: controller.titleController,
              icons: icons[0],
              label: label[0],
              title: title[0],
            ),
            ItemForm(
              icons: icons[1],
              label: label[1],
              title: title[1],
            ),
            ItemForm(
              icons: icons[2],
              label: label[2],
              title: title[2],
            ),
            ItemForm(
              icons: icons[3],
              label: label[3],
              title: title[3],
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff7F00FF),
                        Color(0xffE100FF),
                      ],
                    )),
                child: SizedBox(
                  height: 76,
                  width: 315,
                  child: Center(
                    child: Text(
                      "Create task",
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
