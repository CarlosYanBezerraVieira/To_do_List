import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:to_do_list/application/modules/module.dart';
import 'package:to_do_list/modules/Home/home_page.dart';

class HomeModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: "/home",
      page: () => HomePage(),
    ),
  ];
}
