import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemTask extends StatelessWidget {
  const ItemTask({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, left: 20, bottom: 20, top: 5),
      child: Material(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border(
                        top: BorderSide(width: 1.5, color: Color(0xffBFBFBF)),
                        left: BorderSide(width: 1.5, color: Color(0xffBFBFBF)),
                        right: BorderSide(width: 1.5, color: Color(0xffBFBFBF)),
                        bottom:
                            BorderSide(width: 1.5, color: Color(0xffBFBFBF)),
                      ),
                    ),
                    child: Checkbox(
                      checkColor: Colors.black,
                      fillColor: MaterialStateProperty.all<Color>(
                        Colors.transparent,
                      ),
                      value: true,
                      onChanged: null,
                    ),
                    width: 20,
                    height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              color: Color(0xff292929),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "06.00 AM",
                        style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                                color: Color(0xffABABAB),
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.chevron_right_outlined),
                  color: Colors.black,
                  iconSize: 30,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
