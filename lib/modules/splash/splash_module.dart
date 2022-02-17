import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:to_do_list/application/modules/module.dart';
import 'package:to_do_list/modules/splash/splash_page.dart';
import 'package:to_do_list/modules/splash/splash_page_bindings.dart';

class SplashModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: "/",
      page: () => SplashPage(),
      binding: SplashPageBindings(),
    )
  ];
}
