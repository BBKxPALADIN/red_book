import 'package:get/get.dart';
import 'package:red_book/bindings/visitor_bindings.dart';
import 'package:red_book/ui/visitor/visitor_page.dart';
import '../bindings/splash_bindings.dart';
import '../ui/internet_connection/internet_connection_page.dart';
import '../ui/splash/splash_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const SplashPage(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: AppRoutes.visitor,
      page: () => const VisitorPage(),
      binding: VisitorBindings(),
    ),
    GetPage(
      name: AppRoutes.internetConnection,
      page: () => const InternetConnectionPage(),
    ),
  ];
}
