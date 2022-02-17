import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './splash_page_controller.dart';

class SplashPage extends GetView<SplashPageController> {
  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 228,
              height: 226,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/splash.png"),
                ),
              ),
            ),
            Text(
              "To do \n          List",
              style: TextStyle(color: Colors.grey[500], fontSize: 40),
            )
          ],
        ),
      ),
    );
  }
}
