import 'package:flutter/material.dart';
import 'package:to_do_list/modules/Home/widgets/body/list_taks/widget/item_task.dart';

class ListTask extends StatelessWidget {
  const ListTask({Key? key, required this.onPressed}) : super(key: key);
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    List<String> title = [
      "Briefing with Lokanaka",
      "Pitching with John",
      "Design Landing Page",
      "Design Loka Dashboard",
    ];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return ItemTask(
              title: title[index],
              onPressed: onPressed,
            );
          },
        ),
      ),
    );
  }
}
