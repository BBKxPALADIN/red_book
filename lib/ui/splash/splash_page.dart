import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controller/splash/splash_controller.dart';
import '../../core/theme/app_text_style.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie/lottie2.json',height: 200),
              const SizedBox(height: 16),
              const Text(
                "Red Book",
                style: AppTextStyles.appName,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
