import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../models/taks_model.dart';

class ItemDaily extends StatelessWidget {
  const ItemDaily({Key? key, required this.model, required this.onPressed})
      : super(key: key);
  final Function()? onPressed;
  final TaskModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 20, right: 10, left: 10),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    checkColor: const Color(0xff7F00FF),
                    fillColor: MaterialStateProperty.all<Color>(
                      Colors.white,
                    ),
                    value: true,
                    onChanged: (valor) {}),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width * 0.5,
                        child: Text(model.title ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "06.00 AM",
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: onPressed,
                  icon: const Icon(Icons.chevron_right_outlined),
                  color: Colors.white,
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
