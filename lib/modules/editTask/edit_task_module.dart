import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:to_do_list/application/modules/module.dart';
import 'package:to_do_list/modules/editTask/edit_task.dart';
import 'package:to_do_list/modules/editTask/edit_task_bindings.dart';

class EditTaskModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
        name: '/edit_task', page: () => EditTask(), binding: EditTaskBindings())
  ];
}
