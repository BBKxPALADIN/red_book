import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_book/controller/confirmer/confirmer_controller.dart';
import 'package:red_book/core/theme/app_colors.dart';
import 'package:red_book/core/theme/app_text_style.dart';
import 'package:red_book/core/theme/app_utils.dart';
import 'package:red_book/ui/researcher/widget/profile_item.dart';
import '../../../data/source/local_source.dart';
import '../../../routes/app_routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfirmerController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.greyMain,
          body: controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Container(
                          height: 110,
                          width: 110,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.assets,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(55),
                            child: Center(
                              child: Text(
                                (controller.info.fullName?[0] ?? '')
                                        .toUpperCase() +
                                    (controller.info.fullName?[1] ?? '')
                                        .toUpperCase(),
                                style: AppTextStyles.appName.copyWith(
                                  fontSize: 36,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          controller.info.fullName ?? '',
                          style: AppTextStyles.introTitle,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          controller.info.userType ?? '',
                          style: AppTextStyles.appBarTitle
                              .copyWith(color: AppColors.grey),
                        ),
                        TextButton(
                          onPressed: () async {
                            await LocalSource.instance.logOut();
                            Get.offAndToNamed(AppRoutes.visitor);
                          },
                          child: Text(
                            'Log out',
                            style: AppTextStyles.confirmCodeErrorText
                                .copyWith(fontSize: 15),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ClipRRect(
                            borderRadius: AppUtils.kBorderRadius12,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: AppColors.white,
                              ),
                              child: ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (_, index) => ProfileItem(
                                  title: controller.list[index].title,
                                  image: controller.list[index].image,
                                  onTap: () {},
                                ),
                                separatorBuilder: (_, __) => const Padding(
                                  padding: EdgeInsets.only(left: 16.0),
                                  child: Divider(
                                    height: 1,
                                  ),
                                ),
                                itemCount: controller.list.length,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
