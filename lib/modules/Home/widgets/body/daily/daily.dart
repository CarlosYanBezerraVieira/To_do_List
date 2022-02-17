import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/modules/Home/widgets/body/daily/widget/item_daily.dart';

class Daily extends StatelessWidget {
  Daily({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> titles = ["Wake Up!", "Daily workout"];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            color: Colors.transparent,
            elevation: 10,
            child: Container(
              height: 172,
              width: Get.width * 0.9,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    colors: [
                      Color(0xff7F00FF),
                      Color(0xffE100FF),
                    ],
                  )),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return ItemDaily(title: titles[index]);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
