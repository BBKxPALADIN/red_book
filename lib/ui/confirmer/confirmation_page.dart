import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_book/controller/confirmer/confirmer_controller.dart';

import '../../core/custom_email_text_field.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_style.dart';
import '../../core/theme/app_utils.dart';
import '../../data/models/all_researches_response.dart';
import 'confirm_bottom_sheet.dart';

class ConfirmationPage extends StatelessWidget {
  final Researches info;

  const ConfirmationPage({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfirmerController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.greyMain,
        appBar: AppBar(
          title: Text(
            'Confirmation Page',
            style: AppTextStyles.appName.copyWith(fontSize: 25),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Creature name:',
                  style: AppTextStyles.normalBlack15
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                Text(
                  info.creature?.name ?? '',
                  style: AppTextStyles.normalBlack17
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Description:',
                  style: AppTextStyles.normalBlack15
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                Text(
                  info.creature?.description ?? '',
                  style: AppTextStyles.normalBlack15,
                ),
              ],
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
                  info.creature?.remainingCount.toString() ?? '',
                  style: AppTextStyles.normalBlack15
                      .copyWith(color: AppColors.grey),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Creature type:',
                  style: AppTextStyles.normalBlack15
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                Text(
                  controller.info.subType ?? '',
                  style: AppTextStyles.normalBlack15,
                ),
              ],
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: AppUtils.kRadius20,
                      topRight: AppUtils.kRadius20,
                    ),
                  ),
                  backgroundColor: AppColors.white,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: Get.height * 0.8),
                      child: const ConfirmBottomSheet(),
                    );
                  },
                );
              },
              child: Card(
                margin: const EdgeInsets.all(0),
                shape: const RoundedRectangleBorder(
                  borderRadius: AppUtils.kBorderRadius16,
                ),
                elevation: 0,
                child: ListTile(
                  title: Text(
                    controller.title.isEmpty
                        ? "Will you confirm?"
                        : controller.title,
                    style: controller.title.isEmpty
                        ? AppTextStyles.searchNotFound
                            .copyWith(color: AppColors.grey)
                        : AppTextStyles.countryesName,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 21,
                    color: Color(0xFFC2C3C5),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            CustomEmailTextField(
              labelText: "Comments",
              hintText: 'Please write some comments here',
              keyboardType: TextInputType.text,
              currentFocus: controller.coinsFocus,
              controller: controller.comment,
              inputAction: TextInputAction.done,
              fillColor: AppColors.white,
              labelStyle: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: AppColors.blackSecondary,
              ),
            ),
            const SizedBox(height: 16),
            CustomEmailTextField(
              labelText: "Coins",
              hintText: 'Enter coins number',
              keyboardType: TextInputType.number,
              currentFocus: controller.coinsFocus,
              controller: controller.coins,
              inputAction: TextInputAction.next,
              fillColor: AppColors.white,
              labelStyle: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: AppColors.blackSecondary,
              ),
            ),
          ],
        ),
        floatingActionButton: InkWell(
          onTap: () {
            controller.confirmationRequest(info.id ?? 0);
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              borderRadius: AppUtils.kBorderRadius32,
              color: AppColors.assets,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  'Update status',
                  style: AppTextStyles.appBarTitle
                      .copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
