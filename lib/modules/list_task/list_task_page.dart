import 'package:flutter/material.dart';
import 'package:to_do_list/models/taks_model.dart';
import 'package:to_do_list/modules/Home/home_controller.dart';
import 'package:to_do_list/modules/list_task/widget/item_task.dart';

class ListTaskPage extends StatelessWidget {
  const ListTaskPage({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    List<TaskModel> task = controller.task.value;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.task.length,
          itemBuilder: (context, index) {
            return ItemTask(
              model: task[index],
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
                                Text(task[index].title ?? "nullo"),
                                Text(task[index].description ?? "nullo"),
                                Text(task[index].datatime.toString()),
                                Text(task[index].time.toString()),
                                Text("${task[index].value}"),
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
    );
  }
}
