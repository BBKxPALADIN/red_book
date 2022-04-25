import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_book/controller/visitor/visitor_controller.dart';
import 'package:red_book/core/theme/app_colors.dart';
import 'package:red_book/data/source/local_source.dart';

import '../../core/theme/app_text_style.dart';
import '../../routes/app_routes.dart';

class VisitAnimalsPage extends StatelessWidget {
  const VisitAnimalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VisitorController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.greyMain,
        appBar: AppBar(
          centerTitle: true,
          leading: const SizedBox(),
          title: const Text(
            'Visit Animals',
            style: AppTextStyles.introTitle,
          ),
          actions: [
            TextButton(
              onPressed: () async {
                await LocalSource.instance.logOut();
                Get.offAndToNamed(AppRoutes.visitor);
              },
              child: Text(
                'log out',
                style:
                    AppTextStyles.confirmCodeErrorText.copyWith(fontSize: 15),
              ),
            ),
          ],
        ),
        body: Center(
          child: Text(
            'For Future Work',
            style: AppTextStyles.appBarTitle.copyWith(color: AppColors.assets),
          ),
        ),
      );
    });
  }
}
