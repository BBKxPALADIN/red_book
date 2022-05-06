import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_book/controller/confirmer/confirmer_controller.dart';
import 'package:red_book/ui/admin/widgets/user_type_item.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_style.dart';

class ConfirmBottomSheet extends StatelessWidget {
  const ConfirmBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfirmerController>(
      builder: (controller) {
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
                    'Choose creature type',
                    style: AppTextStyles.bottomSheetTitle,
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.check, color: AppColors.assets),
                  )
                ],
              ),
            ),
            const Divider(height: 1, thickness: 1),
            UserTypeItem(
              title: 'I confirm this research',
              onTap: () {
                controller.setConfirmed(true, 'I confirm this research');
                Get.back();
              },
              trail: controller.title.isNotEmpty && controller.isConfirmed
                  ? const Icon(
                      Icons.check_rounded,
                      color: AppColors.assets,
                      size: 24,
                    )
                  : const SizedBox.shrink(),
            ),
            UserTypeItem(
              title: 'I reject this research',
              onTap: () {
                controller.setConfirmed(false, 'I reject this research');
                Get.back();
              },
              trail: controller.title.isNotEmpty && !controller.isConfirmed
                  ? const Icon(
                      Icons.check_rounded,
                      color: AppColors.assets,
                      size: 24,
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        );
      },
    );
  }
}
