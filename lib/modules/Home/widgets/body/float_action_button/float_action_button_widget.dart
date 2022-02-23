import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/modules/create_task/create_task_page.dart';

class FloatActionButtonWidget extends StatelessWidget {
  const FloatActionButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Container(
        width: 60,
        height: 60,
        child: Icon(
          Icons.add,
          size: 35,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color(0xff7F00FF),
              Color(0xffE100FF),
            ],
          ),
        ),
      ),
      onPressed: () {
        Get.toNamed("/home/create");
      },
    );
  }
}
