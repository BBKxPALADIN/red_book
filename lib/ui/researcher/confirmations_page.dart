import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_book/controller/researcher/researcher_controller.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_style.dart';
import '../../core/theme/app_utils.dart';

class ConfirmationsPage extends StatelessWidget {
  const ConfirmationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyMain,
      appBar: AppBar(
        title: Text(
          'Confirmations',
          style: AppTextStyles.appName.copyWith(fontSize: 25),
        ),
      ),
      body: SafeArea(
        child: GetBuilder<ResearcherController>(
          builder: (controller) {
            return ListView.separated(
              padding: const EdgeInsets.all(12),
              physics: const BouncingScrollPhysics(),
              itemCount: controller.confirmations.confirmations?.length ?? 0,
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
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Visibility(
                          visible: (controller.confirmations
                                  .confirmations?[index].isConfirmed ??
                              false),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '+' +
                                    (controller.confirmations
                                            .confirmations?[index].coinsAmount
                                            .toString() ??
                                        ''),
                                style: AppTextStyles.normalBlack15,
                              ),
                              const Icon(
                                Icons.star_border_outlined,
                                color: AppColors.yellow,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                              borderRadius: AppUtils.kBorderRadius12,
                              color: (controller.confirmations
                                          .confirmations?[index].isConfirmed ??
                                      false)
                                  ? AppColors.assets
                                  : AppColors.red),
                          child: Text(
                            (controller.confirmations.confirmations?[index]
                                        .isConfirmed ??
                                    false)
                                ? 'Confirmed'
                                : 'Rejected',
                            style: AppTextStyles.normalBlack15
                                .copyWith(color: AppColors.white),
                          ),
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
