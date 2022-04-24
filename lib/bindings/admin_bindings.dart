import 'package:get/get.dart';
import '../controller/admin/admin_controller.dart';

class AdminBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AdminController>(AdminController());
  }
}
