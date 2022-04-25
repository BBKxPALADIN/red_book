import 'package:get/get.dart';
import 'package:red_book/data/source/local_source.dart';
import '../../base/base_controller.dart';
import '../../routes/app_routes.dart';

class SplashController extends BaseController {
  @override
  Future<void> onInit() async {
    super.onInit();
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        if(LocalSource.instance.getUserType().isEmpty){
          Get.toNamed(AppRoutes.visitor);
        }else{
          Get.toNamed(AppRoutes.visitor);
        }
      },
    );
  }
}
