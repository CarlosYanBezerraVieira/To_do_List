import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/models/taks_model.dart';
import 'package:to_do_list/modules/Home/home_controller.dart';

import 'widget/item_task.dart';

class ListTaskPage extends StatelessWidget {
  const ListTaskPage({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    //melhor o uso do future builder
    return FutureBuilder(
      future: controller.getTasks(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<TaskModel> tasks = controller.tasks;
          return Obx(() => Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return ItemTask(
                        model: tasks[index],
                        onPressed: () {
                          showDialog(
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      child: Column(
                                        children: [
                                          Text(tasks[index].title ?? "nullo"),
                                          Text(tasks[index].description ??
                                              "nullo"),
                                          Text(
                                              tasks[index].datatime.toString()),
                                          Text(tasks[index].time.toString()),
                                          Text("${tasks[index].value}"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            context: context,
                          );
                        },
                      );
                    },
                  ),
                ),
              ));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Center(child: Text("Erro"));
        } else {
          return Text("Erro");
        }
      },
    );
  }
}
