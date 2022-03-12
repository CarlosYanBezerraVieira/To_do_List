import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/models/taks_model.dart';

class ItemTask extends StatelessWidget {
  const ItemTask({Key? key, required this.onPressed, required this.model})
      : super(key: key);
  final TaskModel model;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Container(
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
                      value: model.value == 0 ? false : true,
                      onChanged: (value) {},
                    ),
                    width: 20,
                    height: 20),
              ),
              GestureDetector(
                onTap: onPressed,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width * 0.5,
                        child: Text(
                          model.title ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                                color: Color(0xff292929),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      model.time != null
                          ? Text(
                              model.time.toString(),
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                      color: Color(0xffABABAB),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            )
                          : SizedBox.shrink()
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.chevron_right_outlined),
                color: Colors.black,
                iconSize: 30,
              ),
            ],
          )
        ],
      ),
    );
  }
}
