import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_book/controller/researcher/researcher_controller.dart';
import 'package:red_book/core/theme/app_colors.dart';

import '../../core/theme/app_text_style.dart';
import '../../core/theme/app_utils.dart';

class AllResearchesPage extends StatelessWidget {
  const AllResearchesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyMain,
      appBar: AppBar(
        title: Text(
          'All researches',
          style: AppTextStyles.appName.copyWith(fontSize: 25),
        ),
      ),
      body: SafeArea(
        child: GetBuilder<ResearcherController>(
          builder: (controller) {
            return ListView.separated(
              padding: const EdgeInsets.all(12),
              physics: const BouncingScrollPhysics(),
              itemCount: controller.all.researches?.length ?? 0,
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
                      controller.all.researches?[index].creature?.name ?? '',
                      style: AppTextStyles.normalBlack17
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      controller.all.researches?[index].creature?.description ??
                          '',
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
                          controller.all.researches?[index].creature
                                  ?.remainingCount
                                  .toString() ??
                              '',
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
      ),
    );
  }
}
