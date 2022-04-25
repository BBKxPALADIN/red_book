import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_book/controller/admin/admin_controller.dart';
import 'package:red_book/ui/admin/widgets/user_type_item.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_style.dart';

class UserTypeBottomSheet extends StatelessWidget {
  const UserTypeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminController>(builder: (controller) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 9.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Choose user type',
                  style: AppTextStyles.bottomSheetTitle,
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.check,color: AppColors.assets),
                )
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, index) => UserTypeItem(
                    title: controller.types[index].name ?? '',
                    onTap: () {
                      controller.setType(controller.types[index].id ?? -1,
                          controller.types[index].name ?? '');
                    },
                    trail: controller.name ==
                            (controller.types[index].name ?? '')
                        ? const Icon(
                            Icons.check_rounded,
                            color: AppColors.assets,
                            size: 24,
                          )
                        : const SizedBox.shrink(),
                  ),
              separatorBuilder: (ctx, index) => const Padding(
                    padding: EdgeInsets.only(left: 70.0),
                    child: Divider(height: 1),
                  ),
              itemCount: controller.types.length),
        ],
      );
    });
  }
}
