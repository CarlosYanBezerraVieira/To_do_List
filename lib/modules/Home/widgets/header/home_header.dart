import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SizedBox(
        width: Get.width,
        height: 190,
        child: Padding(
          padding: EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Thursday",
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0xff7F00FF))),
                      Text(
                        "03 June 2021",
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              color: Color(0xff4A4A4A),
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today",
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ),
                      Text(
                        "Schedule",
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      "2/10 Task today",
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          color: Color(0xff7F00FF),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
