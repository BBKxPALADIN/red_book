import 'package:get/get.dart';
import '../controller/researcher/researcher_controller.dart';
import '../controller/visitor/visitor_controller.dart';

class ResearcherBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>ResearcherController(),fenix: true);
    Get.lazyPut(() => VisitorController(), fenix: true);
  }
}
