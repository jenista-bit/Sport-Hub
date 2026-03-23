// lib/features/home/presentation/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:future_hub/core/constants/app_color.dart';
import 'package:future_hub/core/constants/app_radius.dart';
import 'package:future_hub/core/constants/app_sizes.dart';
import 'package:future_hub/core/constants/app_text_style.dart';
import 'package:future_hub/core/extensions/app_num_extension.dart';
import 'package:future_hub/core/widgets/app_text.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          "Sport Booking Hub",
          style: AppTextStyles.h2.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: true,

        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSizes.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting + Search (optional)
              AppText("สวัสดี! วันนี้อยากเล่นอะไร?", style: AppTextStyles.h3),
              SizedBox(height: AppSizes.md),

              // Search bar (สามารถกดแล้วไปหน้าค้นหาเต็มจอ)
              GestureDetector(
                onTap: () {
                  // Get.toNamed(AppRoutes.searchPage); // ถ้ามี
                  Get.snackbar("ค้นหา", "ฟีเจอร์นี้กำลังพัฒนา");
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.md,
                    vertical: AppSizes.sm,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: AppRadius.allMd,
                    border: Border.all(color: AppColors.divider),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: AppColors.textSecondary),
                      SizedBox(width: AppSizes.sm),
                      AppText(
                        "ค้นหาสนามกีฬา, ที่จอดรถ, ร้านอาหาร...",
                        style: AppTextStyles.bodyMd.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: AppSizes.lg * 1.5),

              // Grid of Services
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: AppSizes.md,
                crossAxisSpacing: AppSizes.md,
                childAspectRatio: 1.1,
                children: [
                  _buildServiceCard(
                    icon: Icons.sports_soccer,
                    title: "จองสนามกีฬา",
                    color: AppColors.accent,
                    isActive: true,
                    onTap: () {
                      Get.snackbar(
                        "กำลังพัฒนา",
                        "หน้าเลือกประเภทสนามกำลังมาเร็ว ๆ นี้",
                      );
                      // Get.toNamed(AppRoutes.sportFieldList);
                    },
                  ),
                  _buildServiceCard(
                    icon: Icons.local_parking,
                    title: "จองที่จอดรถ",
                    color: Colors.grey,
                    isActive: false,
                  ),
                  _buildServiceCard(
                    icon: Icons.restaurant,
                    title: "จองร้านอาหาร",
                    color: Colors.grey,
                    isActive: false,
                  ),
                  _buildServiceCard(
                    icon: Icons.spa,
                    title: "จองอื่น ๆ",
                    color: Colors.grey,
                    isActive: false,
                  ),
                ],
              ),

              SizedBox(height: AppSizes.xl),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildServiceCard({
    required IconData icon,
    required String title,
    required Color color,
    bool isActive = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? color.withOpacity(0.12) : AppColors.surface,
          borderRadius: AppRadius.allMd,
          border: Border.all(
            color: isActive ? color : AppColors.divider,
            width: isActive ? 1.5 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48.sp,
              color: isActive ? color : Colors.grey.shade500,
            ),
            SizedBox(height: AppSizes.sm),
            AppText(
              title,
              style: AppTextStyles.bodyMd.copyWith(
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                color: isActive ? color : Colors.grey.shade700,
              ),
              align: TextAlign.center,
            ),
            if (!isActive) ...[
              SizedBox(height: AppSizes.xs),
              AppText(
                "Coming Soon",
                style: AppTextStyles.caption.copyWith(
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    // ใช้ SellerBottomNavBar เดิม หรือสร้างใหม่ให้เหมาะกับลูกค้า
    // ตัวอย่างแบบง่าย ๆ ก่อน
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            // อยู่หน้า home อยู่แล้ว
          } else if (index == 1) {
            Get.snackbar("การจองของฉัน", "กำลังพัฒนา");
          } else if (index == 2) {
            Get.snackbar("แจ้งเตือน", "กำลังพัฒนา");
          } else {
            Get.snackbar("โปรไฟล์", "กำลังพัฒนา");
          }
        },
        selectedItemColor: AppColors.accent,
        unselectedItemColor: AppColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "หน้าแรก"),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: "การจอง",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: "แจ้งเตือน",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "ฉัน",
          ),
        ],
      ),
    );
  }
}
