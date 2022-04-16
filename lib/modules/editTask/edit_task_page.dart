import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/Shared/widget/date_picker_widget.dart';
import 'package:to_do_list/modules/editTask/edi_task_controller.dart';
import '../../../../Shared/values/icons_svg.dart';
import '../../../../Shared/widget/item_form.dart';

class EditTask extends GetView<EdiTaskController> {
  const EditTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List title = ["Titulo", "Data", "Hora", "Descrição"];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Hero(
        transitionOnUserGestures: true,
        tag: controller.task,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              children: [
                Container(
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15)
                      .copyWith(top: 30),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Column(
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
                            enabled: true,
                            icons: IconsSvg.iconTitle,
                            label: "Titulo",
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
                          child: DatePickerWidget(
                            controller: controller.newdatatimeController,
                            dateTimePickerType: DateTimePickerType.date,
                            typeEntry: DatePickerEntryMode.calendar,
                            icon: SizedBox(
                              width: 24,
                              height: 24,
                              child: SvgPicture.asset(IconsSvg.iconCalendar),
                            ),
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
                          padding: const EdgeInsets.only(top: 10, bottom: 20),
                          child: DatePickerWidget(
                            controller: controller.newtimeController,
                            initialTime: controller.convertHourFromDb(),
                            icon: SizedBox(
                              width: 24,
                              height: 24,
                              child: SvgPicture.asset(IconsSvg.iconTime),
                            ),
                            dateTimePickerType: DateTimePickerType.time,
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
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: ItemForm(
                            controller: controller.descriptionController,
                            enabled: true,
                            label: "Descrição",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
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
          ],
        ),
      ),
    );
  }
}
