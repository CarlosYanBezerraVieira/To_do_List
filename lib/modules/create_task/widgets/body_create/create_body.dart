import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/modules/create_task/create_task_controller.dart';
import '../../../../shared/utils/icons_svg.dart';
import '../../../../shared/widgets/date_picker_widget.dart';
import '../../../../shared/widgets/item_form.dart';
import '../../create_task_controller.dart';

class BodyCreaTask extends GetView<CreateTaskController> {
  const BodyCreaTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List label = ["Titulo", "05 Junho 2021", "10:00 AM", "Descrição"];
    List title = ["Titulo", "Data", "Hora", "Descrição"];
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 30),
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
              child: DatePickerWidget(
                controller: controller.datatimeController,
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
                controller: controller.timeController,
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
      ),
    );
  }
}
