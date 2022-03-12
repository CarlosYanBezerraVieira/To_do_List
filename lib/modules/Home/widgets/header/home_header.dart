import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/modules/Home/home_controller.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key, required this.controller}) : super(key: key);
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    final dataPtDia = DateFormat('dd', 'pt_BR').format(DateTime.now());
    final dataPtMes = DateFormat('MMMM', 'pt_BR').format(DateTime.now());
    final dataPtAno = DateFormat('yyyy', 'pt_BR').format(DateTime.now());

    return Material(
      color: Colors.white,
      child: SizedBox(
        width: Get.width,
        height: 190,
        child: Padding(
          padding: EdgeInsets.only(top: 20, right: 25, left: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Thursday",
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0xff7F00FF))),
                      Text(
                        "${dataPtDia} de ${dataPtMes} de ${dataPtAno}",
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
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://i.pinimg.com/736x/02/e2/bd/02e2bd03565c591275ac582ed81f3c7d.jpg"),
                            fit: BoxFit.cover,
                          )),
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
                        "Suas",
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ),
                      Text(
                        "Tarefas",
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Obx(() => Text(
                          "${controller.sizeTaskSelect}/${controller.sizeTask} Tarefas realizadas",
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                              color: Color(0xff7F00FF),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
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
