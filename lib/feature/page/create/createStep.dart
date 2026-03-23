import 'package:flutter/material.dart';
import 'package:future_hub/core/constants/app_color.dart';
import 'package:future_hub/core/constants/app_radius.dart';
import 'package:future_hub/core/constants/app_sizes.dart';
import 'package:future_hub/core/widgets/app_bar.dart'; // สมมติว่ามี AppBarReserveHub
import 'package:future_hub/core/widgets/app_button.dart';
import 'package:future_hub/core/widgets/dynamic_text_field.dart';
import 'package:future_hub/core/widgets/radio_butto_seleect.dart';
import 'package:future_hub/feature/controller/create_controller.dart'; // หรือ create_account_controller.dart
import 'package:get/get.dart';
// ... import เดิมทั้งหมด ...

class CreateAccountStep1Page extends GetView<CreateAccountController> {
  CreateAccountStep1Page({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarReserveHub(
        title: "Create Account",
        foregroundColor: AppColors.black,
        showBackButton: false,

        centerTitle: false,
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            controller: controller.scrollController,
            padding: EdgeInsets.all(AppSizes.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ROLE
                Obx(
                  () => Container(
                    key: controller.roleKey,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: controller.showRoleError.value
                            ? AppColors.error
                            : Colors.transparent,
                        width: 1.5,
                      ),
                      borderRadius: AppRadius.allMd,
                    ),
                    child: Column(
                      children: [
                        RoleOptionCard(
                          icon: Icons.sports_handball,
                          title: "Player",
                          subtitle: "Join games and book courts",
                          value: "player",
                          isSelected: controller.selectedRole.value == "player",
onChanged: (_) => controller.selectRole("player"),
                        ),
                        Divider(height: 1),
                        RoleOptionCard(
                          icon: Icons.storefront,
                          title: "Venue Owner",
                          subtitle: "Manage your sports facility",
                          value: "venue_owner",
                          isSelected: controller.selectedRole.value == "venue_owner",
onChanged: (_) => controller.selectRole("venue_owner"),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: AppSizes.xl),

                /// FULL NAME
                Container(
                  key: controller.fullNameKey,
                  child: DynamicTextField(
                    mode: DynamicTextFieldMode.textField,
                    label: "Full Name",
                    labelColor: AppColors.black,
                    borderColor: AppColors.borderColor,
                    hintText: "John Doe",
                    controller: controller.fullNameController,
                    required: true,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'กรุณากรอกชื่อ-นามสกุล';
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: AppSizes.md),

                DynamicTextField(
                  mode: DynamicTextFieldMode.textField,
                  label: "Favorite Sports",
                  hintText: "Tennis, Basketball, Padel",
                  labelColor: AppColors.black,
                  borderColor: AppColors.borderColor,
                  controller: controller.favoriteSportsController,
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: AppButton(
          label: "Continue",
          onPressed: () => controller.submitStep1(_formKey),
        ),
      ),
    );
  }
}

// RoleOptionCard เหมือนเดิม ไม่ต้องแก้
