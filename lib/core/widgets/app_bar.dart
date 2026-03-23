import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_hub/core/constants/app_color.dart';
import 'package:future_hub/core/constants/app_text_style.dart';
import 'package:future_hub/core/widgets/app_text.dart';
import 'package:get/get.dart';

class AppBarReserveHub extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final bool centerTitle;
  final double? elevation;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final PreferredSizeWidget?
  bottom; // สำหรับ tab bar หรือ search bar ใต้ appbar

  const AppBarReserveHub({
    super.key,
    this.title,
    this.showBackButton = true,
    this.onBackPressed,
    this.actions,
    this.centerTitle = true,
    this.elevation = 0,
    this.backgroundColor,
    this.foregroundColor,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveForegroundColor = foregroundColor ?? AppColors.textPrimary;

    return AppBar(
      leading: showBackButton
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: effectiveForegroundColor,
                size: 28,
              ),
              tooltip: 'ย้อนกลับ',
              onPressed: onBackPressed ?? () => Get.back(),
            )
          : null, // ถ้าไม่แสดง back → leading จะเป็น null (ไม่เว้นที่)
      // ถ้าไม่มี leading และอยากให้ title ชิดซ้ายตอนไม่มี back
      automaticallyImplyLeading: showBackButton,

      title: title != null
          ? AppText(
              title!,
              style: AppTextStyles.h2.copyWith(
                color: effectiveForegroundColor,
                fontWeight: FontWeight.w700,
              ),
            )
          : null,

      centerTitle: centerTitle,

      backgroundColor: backgroundColor ?? AppColors.background,

      elevation: elevation ?? 0,

      surfaceTintColor: Colors.transparent, // ป้องกัน tint สีตอน scroll

      // shadowColor: AppColors.black.withOpacity(0.08), // ถ้าอยากให้มีเงาอ่อน ๆ
      actions: actions,

      bottom: bottom,

      // มาตรฐาน 2025+: ใช้ shape เพื่อมุมโค้งเล็กน้อย (optional)
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(0)),
      ),

      // รองรับ system UI overlay (status bar)
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            Brightness.dark, // หรือ Brightness.light ตามธีม
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}
