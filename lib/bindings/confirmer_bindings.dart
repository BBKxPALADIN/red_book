import 'package:get/get.dart';
import '../controller/confirmer/confirmer_controller.dart';

class ConfirmerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>ConfirmerController(),fenix: true);
  }
}
