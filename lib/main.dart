import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/modules/Home/home_module.dart';
import 'package:to_do_list/modules/editTask/edit_task_module.dart';
import 'package:to_do_list/modules/splash/splash_module.dart';
import 'application/bindinds/application_bindings.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'modules/create_task/create_task_module.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      title: 'To do List',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.grey),
      ),
      initialBinding: ApplicationBindings(),
      getPages: [
        ...SplashModule().routers,
        ...HomeModule().routers,
        ...CreateTaskModule().routers,
        ...EditTaskModule().routers
      ],
    );
  }
}
