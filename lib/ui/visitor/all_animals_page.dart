import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_book/controller/visitor/visitor_controller.dart';
import 'package:red_book/core/theme/app_colors.dart';
import 'package:red_book/core/theme/app_text_style.dart';
import 'package:red_book/core/theme/app_utils.dart';

class AllAnimalsPage extends StatelessWidget {
  const AllAnimalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyMain,
      appBar: AppBar(
        centerTitle: true,
        leading: const SizedBox(),
        title: const Text(
          'All Animals',
          style: AppTextStyles.introTitle,
        ),
      ),
      body: GetBuilder<VisitorController>(
        builder: (controller) {
          return ListView.separated(
            padding: const EdgeInsets.all(12),
            physics: const BouncingScrollPhysics(),
            itemCount: controller.creatures.length,
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                borderRadius: AppUtils.kBorderRadius12,
                color: AppColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.creatures[index].name ?? '',
                    style: AppTextStyles.normalBlack17
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    controller.creatures[index].description ?? '',
                    style: AppTextStyles.normalBlack15,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Remaining count:',
                        style: AppTextStyles.normalBlack15
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        controller.creatures[index].remainingCount.toString(),
                        style: AppTextStyles.normalBlack15
                            .copyWith(color: AppColors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            separatorBuilder: (ctx, index) => const SizedBox(height: 12),
          );
        },
      ),
    );
  }
}
