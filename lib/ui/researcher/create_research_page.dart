import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_book/controller/researcher/researcher_controller.dart';
import 'package:red_book/ui/researcher/widget/creature_type_bottom_sheet.dart';
import '../../core/custom_email_text_field.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_style.dart';
import '../../core/theme/app_utils.dart';

class CreateResearchPage extends StatelessWidget {
  const CreateResearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResearcherController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.greyMain,
          appBar: AppBar(
            title: Text(
              'Create New Research',
              style: AppTextStyles.appName.copyWith(fontSize: 25),
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                'Creature Type',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackSecondary,
                ),
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
                        constraints:
                            BoxConstraints(maxHeight: Get.height * 0.8),
                        child: const CreatureTypeBottomSheet(),
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
                      controller.chosenType == -1
                          ? "Choose creature type"
                          : controller.type,
                      style: controller.type.isEmpty
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
                labelText: "Creature Name",
                hintText: 'Enter creature name',
                keyboardType: TextInputType.text,
                currentFocus: controller.nameFocus,
                controller: controller.name,
                nextFocus: controller.remainingFocus,
                inputAction: TextInputAction.next,
                fillColor: AppColors.white,
                labelStyle: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackSecondary,
                ),
              ),
              const SizedBox(height: 16),
              CustomEmailTextField(
                labelText: "Remaining count",
                hintText: 'Enter remaining count',
                keyboardType: TextInputType.number,
                currentFocus: controller.remainingFocus,
                controller: controller.remaining,
                nextFocus: controller.descriptionFocus,
                inputAction: TextInputAction.next,
                fillColor: AppColors.white,
                labelStyle: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackSecondary,
                ),
              ),
              const SizedBox(height: 16),
              CustomEmailTextField(
                labelText: "Description",
                hintText: 'Enter description for creature',
                keyboardType: TextInputType.text,
                currentFocus: controller.descriptionFocus,
                controller: controller.description,
                inputAction: TextInputAction.done,
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
              controller.createResearch(context);
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
                    'Add research',
                    style: AppTextStyles.appBarTitle
                        .copyWith(color: AppColors.white),
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
