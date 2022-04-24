import 'package:get/get.dart';
import 'package:red_book/controller/visitor/visitor_controller.dart';

class VisitorBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<VisitorController>(VisitorController());
  }
}
