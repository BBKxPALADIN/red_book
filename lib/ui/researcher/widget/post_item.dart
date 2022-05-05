import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_utils.dart';
import '../../../core/theme/app_text_style.dart';

class PostItem extends StatelessWidget {
  final String image;
  final String title;
  final String body;

  const PostItem({
    Key? key,
    required this.image,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, right: 12,bottom: 12),
      decoration: const BoxDecoration(
        borderRadius: AppUtils.kBorderRadius12,
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: AppUtils.kBorderRadius25,
                  child: SizedBox(
                    height: 32,
                    width: 32,
                    child: Image.asset(
                      'assets/jpg/profile.jpg',
                      fit: BoxFit.fill,
                    ),
                  )
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('John Doe', style: AppTextStyles.appBarTitle),
                    Text(
                      '25-02-2022',
                      style: AppTextStyles.normalTriarity13,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 12, bottom: 16),
            child: ClipRRect(
              borderRadius: AppUtils.kBorderRadius12,
              child: CachedNetworkImage(
                height: 164 * Get.height / 812,
                width: double.infinity,
                imageUrl: image,
                fit: BoxFit.fill,
                errorWidget: (_, __, ___) => Container(
                  height: 164 * Get.height / 812,
                  width: double.infinity,
                  color: AppColors.assets,
                  child: const Icon(
                    Icons.image,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              title,
              style: AppTextStyles.productTitle
                  .copyWith(color: AppColors.blackSecondary),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              body,
              style: const TextStyle(
                color: AppColors.triarity,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
