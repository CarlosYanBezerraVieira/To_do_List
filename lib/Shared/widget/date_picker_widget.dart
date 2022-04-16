import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/Shared/values/mask_form.dart';

class DatePickerWidget extends StatelessWidget {
  final Widget icon;
  final DatePickerEntryMode? typeEntry;
  final DateTimePickerType dateTimePickerType;
  final bool timePickerEntryModeInput;
  final DateTime? initialDate;
  final TimeOfDay? initialTime;
  final controller;
  final bool Function(DateTime)? selectableDayPredicate;
  const DatePickerWidget(
      {Key? key,
      required this.icon,
      this.typeEntry,
      required this.dateTimePickerType,
      this.timePickerEntryModeInput = false,
      this.controller,
      this.selectableDayPredicate,
      this.initialDate,
      this.initialTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      decoration: InputDecoration(
          filled: true,
          floatingLabelStyle: GoogleFonts.nunito(color: Colors.black),
          icon: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: icon,
          ),
          border: InputBorder.none),
      style: GoogleFonts.nunito(),
      cursorColor: Colors.grey,
      enableInteractiveSelection: true,
      use24HourFormat: true,
      controller: controller,
      locale: Locale("pt", "BR"),
      initialDate: initialDate ?? DateTime.now(),
      initialEntryMode: typeEntry,
      timePickerEntryModeInput: timePickerEntryModeInput,
      inputFormatters: [MaskForm().maskFormatterDateTime],
      dateMask: 'dd/MM/yyyy',
      type: dateTimePickerType,
      firstDate: DateTime.now(),
      lastDate: DateTime(2110),
      initialTime: initialTime ?? TimeOfDay.now(),
      selectableDayPredicate: selectableDayPredicate,
      validator: (validator) {
        return null;
      },
    );
  }
}
