import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/modules/Home/home_module.dart';
import 'package:to_do_list/modules/splash/splash_module.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'To do List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        ...SplashModule().routers,
        ...HomeModule().routers,
      ],
    );
  }
}
