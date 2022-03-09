import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/modules/Home/home_controller.dart';
import 'package:to_do_list/modules/Home/widgets/body/daily/daily.dart';
import 'package:to_do_list/modules/Home/widgets/body/float_action_button/float_action_button_widget.dart';
import 'package:to_do_list/modules/Home/widgets/header/home_header.dart';
import 'package:to_do_list/modules/list_task/list_task_page.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            HomeHeader(),
            Daily(),
            ListTaskPage(
              controller: controller,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 60,
        height: 60,
        child: FloatActionButtonWidget(),
      ),
    );
  }
}
