import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/modules/editTask/edi_task_controller.dart';
import '../../../../Shared/values/icons_svg.dart';
import '../../../../Shared/widget/item_form.dart';

class EditTask extends GetView<EdiTaskController> {
  const EditTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Hero(
          transitionOnUserGestures: true,
          tag: controller.task,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () => Get.back(),
                                icon: Icon(Icons.chevron_left)),
                            Text("Editar",
                                style: GoogleFonts.nunito(
                                    textStyle:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    fontSize: 24)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Text("Tarefa",
                              style: GoogleFonts.nunito(
                                  textStyle:
                                      TextStyle(fontWeight: FontWeight.bold),
                                  fontSize: 24)),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      ItemForm(
                        controller: controller.titleController,
                        enabled: true,
                        icons: IconsSvg.iconTitle,
                        label: "Titulo",
                      ),
                      ItemForm(
                        controller: controller.datatimeController,
                        enabled: true,
                        icons: IconsSvg.iconCalendar,
                        label: "Data",
                      ),
                      ItemForm(
                        controller: controller.timeController,
                        enabled: true,
                        icons: IconsSvg.iconTime,
                        label: "Time",
                      ),
                      ItemForm(
                        controller: controller.descriptionController,
                        enabled: true,
                        label: "Description",
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      controller.updateTask();
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
                          "Save",
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
        ),
      ),
    );
  }
}
