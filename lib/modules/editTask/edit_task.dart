import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Shared/values/icons_svg.dart';
import '../../../../Shared/widget/item_form.dart';

class EditTask extends StatelessWidget {
  const EditTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        transitionOnUserGestures: true,
        tag: 'edit',
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () => Get.back(),
                              icon: Icon(Icons.chevron_left)),
                          Text("Editar",
                              style: GoogleFonts.nunito(
                                  textStyle:
                                      TextStyle(fontWeight: FontWeight.bold),
                                  fontSize: 24)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Text("Tarefa",
                            style: GoogleFonts.nunito(
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                                fontSize: 24)),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    ItemForm(
                      enabled: false,
                      icons: IconsSvg.iconTitle,
                      label: "Titulo",
                    ),
                    ItemForm(
                      enabled: false,
                      icons: IconsSvg.iconCalendar,
                      label: "Data",
                    ),
                    ItemForm(
                      enabled: false,
                      icons: IconsSvg.iconTime,
                      label: "Time",
                    ),
                    ItemForm(
                      enabled: false,
                      label: "Description",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
