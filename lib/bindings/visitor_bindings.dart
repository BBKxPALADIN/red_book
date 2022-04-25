import 'package:get/get.dart';
import 'package:red_book/controller/visitor/visitor_controller.dart';

import '../controller/auth/auth_controller.dart';

class VisitorBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VisitorController(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);
  }
}
