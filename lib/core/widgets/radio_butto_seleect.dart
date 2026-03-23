import 'package:flutter/material.dart';
import 'package:future_hub/core/constants/app_color.dart';
import 'package:future_hub/core/constants/app_radius.dart';
import 'package:future_hub/core/constants/app_sizes.dart';
import 'package:future_hub/core/constants/app_text_style.dart';
import 'package:future_hub/core/extensions/app_num_extension.dart';
import 'package:future_hub/core/widgets/app_text.dart';

class RoleOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  final String value;
  final bool isSelected;

  final VoidCallback? onTap;
  final ValueChanged<bool?>? onChanged;

  const RoleOptionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.isSelected,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
        onChanged?.call(!isSelected);
      },
      child: Container(
        padding: EdgeInsets.all(AppSizes.md),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.accent.withOpacity(0.08)
              : AppColors.surface,
          borderRadius: AppRadius.allMd,
          border: Border.all(
            color: isSelected ? AppColors.accent : AppColors.divider,
            width: isSelected ? 1.8 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 32.sp,
              color: isSelected ? AppColors.accent : AppColors.textSecondary,
            ),

            SizedBox(width: AppSizes.md),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title,
                    style: AppTextStyles.bodyLg.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? AppColors.accent
                          : AppColors.textPrimary,
                    ),
                  ),

                  SizedBox(height: 2.h),

                  AppText(
                    subtitle,
                    style: AppTextStyles.bodyMd.copyWith(
                      color: isSelected
                          ? AppColors.black
                          : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            Checkbox(
              value: isSelected,
              activeColor: AppColors.accent,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
