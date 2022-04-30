import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './create_task_controller.dart';
import 'widgets/body_create/create_body.dart';
import 'widgets/header/header_create_taks.dart';

class CreateTaskPage extends GetView<CreateTaskController> {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: Get.height,
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: HeaderCreateTask(),
                    ),
                    BodyCreaTask(),
                  ],
                ),
                Positioned(
                  right: 25,
                  left: 25,
                  bottom: 30,
                  child: InkWell(
                    onTap: () {
                      controller.newTask();
                      Get.back();
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff7F00FF),
                              Color(0xffE100FF),
                            ],
                          )),
                      height: 76,
                      width: 315,
                      child: Center(
                        child: Text(
                          "Criar Tarefa",
                          style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
