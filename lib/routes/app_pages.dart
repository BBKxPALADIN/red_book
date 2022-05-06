import 'package:get/get.dart';
import 'package:red_book/bindings/admin_bindings.dart';
import 'package:red_book/bindings/auth_bindings.dart';
import 'package:red_book/bindings/researcher_bindings.dart';
import 'package:red_book/bindings/visitor_bindings.dart';
import 'package:red_book/ui/admin/admin_main_page.dart';
import 'package:red_book/ui/admin/new_user_page.dart';
import 'package:red_book/ui/auth/login_page.dart';
import 'package:red_book/ui/researcher/researcher_main_page.dart';
import 'package:red_book/ui/visitor/visitor_page.dart';
import '../bindings/confirmer_bindings.dart';
import '../bindings/splash_bindings.dart';
import '../ui/confirmer/confirmer_main_page.dart';
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
    GetPage(
      name: AppRoutes.auth,
      page: () => const AuthPage(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoutes.admin,
      page: () => const AdminMainPage(),
      binding: AdminBindings(),
    ),
    GetPage(
      name: AppRoutes.newUser,
      page: () => const NewUserPage(),
    ),
    GetPage(
      name: AppRoutes.researcher,
      page: () => const ResearcherMainPage(),
      binding: ResearcherBindings(),
    ),
    GetPage(
      name: AppRoutes.confirmer,
      page: () => const ConfirmerMainPage(),
      binding: ConfirmerBindings(),
    ),
  ];
}
