import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemForm extends StatelessWidget {
  ItemForm(
      {Key? key,
      this.maxLines,
      this.icons = '',
      required this.label,
      this.controller,
      this.enabled = true,
      this.autofocus = false,
      this.initialValue,
      this.inputFormatters,
      this.keyboardType})
      : super(key: key);
  final String icons;
  final String label;
  final String? initialValue;
  final int? maxLines;
  final bool enabled;
  final bool autofocus;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: TextFormField(
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          initialValue: initialValue,
          autofocus: autofocus,
          cursorColor: Colors.grey,
          maxLines: maxLines,
          controller: controller,
          decoration: InputDecoration(
              labelStyle: GoogleFonts.nunito(),
              contentPadding: EdgeInsets.zero,
              enabled: enabled,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              icon: icons.isNotEmpty
                  ? SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(icons),
                    )
                  : null,
              label: Text(
                label,
                style: GoogleFonts.nunito(
                    textStyle: TextStyle(color: Colors.black)),
              ),
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}
