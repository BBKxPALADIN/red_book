import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_book/controller/admin/admin_controller.dart';
import 'package:red_book/core/theme/app_colors.dart';
import 'package:red_book/core/theme/app_text_style.dart';
import 'package:red_book/core/theme/app_utils.dart';
import 'package:red_book/routes/app_routes.dart';

import '../../data/source/local_source.dart';

class AdminMainPage extends StatelessWidget {
  const AdminMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyMain,
      appBar: AppBar(
        title: Text(
          'Welcome Admin',
          style: AppTextStyles.appName.copyWith(fontSize: 25),
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
      body: GetBuilder<AdminController>(builder: (controller) {
        return controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
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
                    child: InkWell(
                      onTap: () async {
                        final result = await Get.toNamed(AppRoutes.newUser);
                        controller.getAllUsers();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Create new user',
                            style: AppTextStyles.normalBlack415,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Users list',
                    textAlign: TextAlign.start,
                    style: AppTextStyles.introTitle,
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.users.length,
                      separatorBuilder: (ctx, index) =>
                          const SizedBox(height: 12),
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
                    ),
                  )
                ],
              );
      }),
    );
  }
}
