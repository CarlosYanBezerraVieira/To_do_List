import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemForm extends StatelessWidget {
  ItemForm(
      {Key? key,
      this.maxLines,
      this.icons = '',
      required this.label,
      this.controller,
      this.enabled = true,
      this.autofocus = false})
      : super(key: key);
  final String icons;
  final String label;

  final int? maxLines;
  final bool enabled;
  final bool autofocus;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          autofocus: autofocus,
          cursorColor: Colors.grey,
          maxLines: maxLines,
          controller: controller,
          decoration: InputDecoration(
              enabled: enabled,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              icon: Visibility(
                visible: icons.isNotEmpty,
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset(icons),
                ),
              ),
              label: Text(label),
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}
