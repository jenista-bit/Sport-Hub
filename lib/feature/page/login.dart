import 'package:flutter/material.dart';
import 'package:future_hub/core/constants/app_color.dart';
import 'package:future_hub/core/constants/app_sizes.dart';
import 'package:future_hub/core/constants/app_text_style.dart';
import 'package:future_hub/core/extensions/app_num_extension.dart';
import 'package:future_hub/core/widgets/app_button.dart';
import 'package:future_hub/core/widgets/app_text.dart';
import 'package:future_hub/core/widgets/dynamic_text_field.dart';
import 'package:future_hub/feature/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,

        /// 🌈 Gradient Background
        decoration: const BoxDecoration(color: AppColors.white),

        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.screenPadding,
                        vertical: AppSizes.md,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: AppSizes.xxl * 1.5),

                          /// LOGO
                          Container(
                            width: 100.w,
                            height: 100.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.surface,
                              border: Border.all(
                                color: AppColors.borderLight,
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.black.withOpacity(0.35),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.sports_tennis_rounded,
                              size: 60,
                              color: AppColors.iconPrimary,
                            ),
                          ),

                          SizedBox(height: AppSizes.xl),

                          /// APP NAME
                          AppText(
                            "Reserve Hub",
                            style: TextStyle(
                              fontSize: 40.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                              letterSpacing: 1.2,
                              shadows: [
                                Shadow(
                                  color: AppColors.black.withOpacity(0.4),
                                  offset: const Offset(2, 2),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: AppSizes.xs),

                          /// SUBTITLE
                          AppText(
                            "จองสนามกีฬาได้ง่าย ไม่ต้องต่อคิว",
                            style: TextStyle(
                              fontSize: AppSizes.bodyLg,
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            align: TextAlign.center,
                          ),

                          SizedBox(height: AppSizes.xxl * 1.5),

                          /// PHONE INPUT
                          DynamicTextField(
                            mode: DynamicTextFieldMode.textField,
                            hintText: "กรุณากรอกเบอร์โทรศัพท์",
                            controller: controller.phoneController,
                            borderColor: AppColors.borderColor,
                            keyboardType: TextInputType.phone,
                            //borderColor: AppColors.border,
                            suffixIcon: const Icon(Icons.phone_android),

                            label: 'เบอร์โทรศัพท์',
                            labelColor: AppColors.black,
                          ),

                          SizedBox(height: AppSizes.lg),

                          /// LOGIN BUTTON
                          AppButton(
                            label: "ถัดไป",
                            backgroundColor: AppColors.accent,
                            textColor: AppColors.textPrimary,
                            onPressed: controller.loginWithPhone,
                          ),

                          const Spacer(),

                          /// FOOTER
                          AppText(
                            "การเข้าสู่ระบบแสดงว่าคุณยอมรับ\nข้อกำหนดการใช้งานและนโยบายความเป็นส่วนตัว",
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.black,
                            ),
                            align: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
