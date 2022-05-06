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
        if(LocalSource.instance.getUserType()=='superadmin'){
          Get.offAndToNamed(AppRoutes.admin);
        }else if(LocalSource.instance.getUserType()=='researchers'){
          Get.offAndToNamed(AppRoutes.researcher);
        }else if(LocalSource.instance.getUserType()=='research_confirmers'){
          Get.offAndToNamed(AppRoutes.confirmer);
        }else{
          Get.offAndToNamed(AppRoutes.visitor);
        }
      },
    );
  }
}
