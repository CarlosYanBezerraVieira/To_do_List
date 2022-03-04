import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/models/taks_model.dart';
import 'package:to_do_list/modules/Home/home_controller.dart';
import 'package:to_do_list/modules/Home/widgets/body/daily/daily.dart';
import 'package:to_do_list/modules/Home/widgets/body/float_action_button/float_action_button_widget.dart';
import 'package:to_do_list/modules/Home/widgets/body/list_taks/list_task.dart';
import 'package:to_do_list/modules/Home/widgets/header/home_header.dart';

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
            ListTask(
              onPressed: () async {
                List<TaskModel?> task = await controller.getTask();
                showDialog(
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: ListView.builder(
                                itemCount: task.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(task[index]?.title ?? "nullo"),
                                      Text(task[index]?.description ?? "nullo"),
                                      Text(task[index]?.datatime.toString() ??
                                          "nullo"),
                                      Text(task[index]?.time.toString() ??
                                          "nullo"),
                                      Text("${task[index]?.value}"),
                                    ],
                                  );
                                }),
                          ),
                        ],
                      ),
                    );
                  },
                  context: context,
                );
              },
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
