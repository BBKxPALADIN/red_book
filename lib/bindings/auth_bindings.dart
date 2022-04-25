import 'package:get/get.dart';
import '../controller/auth/auth_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>AuthController(),fenix: true);
  }
}
