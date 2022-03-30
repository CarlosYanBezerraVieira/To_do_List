import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/Shared/values/icons_svg.dart';
import 'package:to_do_list/Shared/values/mask_form.dart';
import 'package:to_do_list/modules/create_task/create_task_controller.dart';
import 'package:to_do_list/Shared/widget/item_form.dart';
import '../../create_task_controller.dart';

class BodyCreaTask extends GetView<CreateTaskController> {
  const BodyCreaTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List label = ["Titulo", "05 Junho 2021", "10:00 AM", "Descrição"];
    List title = ["Titulo", "Data", "Hora", "Descrição"];
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(
          top: 30,
        ),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title[0],
                  style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ItemForm(
                    controller: controller.titleController,
                    icons: IconsSvg.iconTitle,
                    label: label[0],
                  ),
                ),
                Text(
                  title[1],
                  style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ItemForm(
                    inputFormatters: [MaskForm().maskFormatterDateTime],
                    controller: controller.datatimeController,
                    icons: IconsSvg.iconCalendar,
                    label: label[1],
                  ),
                ),
                Text(
                  title[2],
                  style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ItemForm(
                    inputFormatters: [MaskForm().maskFormatterTime],
                    maxLines: 1,
                    controller: controller.timeController,
                    icons: IconsSvg.iconTime,
                    label: label[2],
                  ),
                ),
                Text(
                  title[3],
                  style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: ItemForm(
                    controller: controller.descriptionController,
                    label: label[3],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: InkWell(
                onTap: () {
                  controller.newTask();
                  Get.back();
                },
                child: Ink(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff7F00FF),
                          Color(0xffE100FF),
                        ],
                      )),
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
            ),
          ],
        ),
      ),
    );
  }
}
