import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:to_do_list/application/modules/module.dart';
import 'create_task_bindings.dart';
import 'create_task_page.dart';

class CreateTaskModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: "/home/create",
      page: () => CreateTaskPage(),
      binding: CreateTaskBindings(),
    )
  ];
}
