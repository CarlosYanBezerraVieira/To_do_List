import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderCreateTask extends StatelessWidget {
  const HeaderCreateTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Text("Criar",
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(fontWeight: FontWeight.bold),
                        fontSize: 24)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text("Tarefa",
                  style: GoogleFonts.nunito(
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                      fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }
}
