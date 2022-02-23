import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_fonts/google_fonts.dart';

class ItemForm extends StatelessWidget {
  ItemForm(
      {Key? key, required this.icons, required this.label, required this.title})
      : super(key: key);
  final String icons;
  final String label;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset(icons),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 250,
                      child: TextFormField(
                        decoration: InputDecoration(
                            label: Text(label),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
