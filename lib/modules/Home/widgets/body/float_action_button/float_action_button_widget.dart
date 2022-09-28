import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/modules/Home/home_controller.dart';

class FloatActionButtonWidget extends GetView<HomeController> {
  const FloatActionButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await Get.toNamed("/home/create");
        controller.getTasks();
      },
      child: Ink(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color(0xff7F00FF),
                Color(0xffE100FF),
              ],
            )),
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}
