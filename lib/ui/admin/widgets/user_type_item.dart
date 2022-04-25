import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';

class UserTypeItem extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final Widget? trail;

  const UserTypeItem({
    Key? key,
    required this.title,
    this.onTap,
    this.trail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.profileItem,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              trail ??
                  const Icon(
                    Icons.keyboard_arrow_right_rounded,
                    size: 24,
                    color: AppColors.black7,
                  )
            ],
          ),
        ),
      ),
    );
  }
}
