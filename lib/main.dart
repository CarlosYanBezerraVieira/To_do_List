import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/modules/Home/home_module.dart';
import 'package:to_do_list/modules/create_task/create_task_module.dart';
import 'package:to_do_list/modules/splash/splash_module.dart';

import 'application/bindinds/application_bindings.dart';

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
      initialBinding: ApplicationBindings(),
      getPages: [
        ...SplashModule().routers,
        ...HomeModule().routers,
        ...CreateTaskModule().routers
      ],
    );
  }
}
