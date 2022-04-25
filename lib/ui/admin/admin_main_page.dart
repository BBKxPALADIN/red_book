import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_book/controller/admin/admin_controller.dart';
import 'package:red_book/core/theme/app_colors.dart';
import 'package:red_book/core/theme/app_text_style.dart';
import 'package:red_book/core/theme/app_utils.dart';

class AdminMainPage extends StatelessWidget {
  const AdminMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyMain,
      appBar: AppBar(
        title: const Text(
          'Welcome Admin',
          style: AppTextStyles.appBarTitle,
        ),
      ),
      body: GetBuilder<AdminController>(builder: (controller) {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Admin\'s abilities',
              textAlign: TextAlign.start,
              style: AppTextStyles.introTitle,
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: AppUtils.kBorderRadius12,
              ),
              child: const Text(
                '',
                style: AppTextStyles.normalBlack415,
              ),
            ),
            ListView.separated(
              itemCount: controller.users.length,
              separatorBuilder: (ctx, index) => const SizedBox(height: 12),
              itemBuilder: (ctx, index) => Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  borderRadius: AppUtils.kBorderRadius12,
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Full Name:',
                          style: AppTextStyles.normalBlack15
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          controller.users[index].fullName ?? '',
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
                          'User Type:',
                          style: AppTextStyles.normalBlack15
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          controller.users[index].userType ?? '',
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
                          'Login:',
                          style: AppTextStyles.normalBlack15
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          controller.users[index].login ?? '',
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
                          'Password:',
                          style: AppTextStyles.normalBlack15
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          controller.users[index].password ?? '',
                          style: AppTextStyles.normalBlack15
                              .copyWith(color: AppColors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
