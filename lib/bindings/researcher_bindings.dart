import 'package:get/get.dart';
import '../controller/researcher/researcher_controller.dart';

class ResearcherBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ResearcherController>(ResearcherController());
  }
}
