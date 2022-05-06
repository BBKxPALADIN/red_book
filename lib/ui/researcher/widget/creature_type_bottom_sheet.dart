import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_book/controller/researcher/researcher_controller.dart';
import 'package:red_book/ui/admin/widgets/user_type_item.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_style.dart';

class CreatureTypeBottomSheet extends StatelessWidget {
  const CreatureTypeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResearcherController>(
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
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, index) => UserTypeItem(
                      title: controller.listTypes[index].name ?? '',
                      onTap: () {
                        controller.setType(controller.listTypes[index].id ?? -1,
                            controller.listTypes[index].name ?? '');
                        Get.back();
                      },
                      trail: controller.type ==
                              (controller.listTypes[index].name ?? '')
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
                itemCount: controller.listTypes.length),
          ],
        );
      },
    );
  }
}
