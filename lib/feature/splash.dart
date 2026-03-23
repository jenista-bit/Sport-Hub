import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_hub/core/constants/app_color.dart';
import 'package:future_hub/core/constants/app_radius.dart';
import 'package:future_hub/core/constants/app_sizes.dart';
import 'package:future_hub/core/extensions/app_num_extension.dart';
import 'package:future_hub/core/widgets/app_loading.dart';
import 'package:future_hub/core/widgets/app_text.dart';
import 'package:future_hub/feature/controller/splash_controller.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Lock orientation to portrait

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primary.withOpacity(0.95), // สีหลักเข้ม
              const Color(0xFF0D47A1), // น้ำเงินเข้มกว่า (สนาม/ท้องฟ้า)
              const Color(0xFF042A6B), // เข้มสุดด้านล่าง
            ],
            stops: const [0.0, 0.6, 1.0],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Background subtle overlay (optional stadium feel)
              // Positioned.fill(
              //   child: Opacity(
              //     opacity: 0.15,
              //     child: Image.asset(
              //       'assets/images/stadium_bg.png', // ถ้ามีรูปพื้นหลังสนาม ใส่ตรงนี้ (optional)
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),

              // Main content
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo square with checkered flag
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons
                              .sports_tennis_rounded, // หรือ Icons.flag_rounded ถ้าอยากใกล้เคียงธงหมากรุก
                          size: 70,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: AppSizes.xxl),

                    // App Name
                    AppText(
                      "Reserve Hub",
                      style: TextStyle(
                        fontSize: 30.0.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
                    // Underline
                    Container(
                      width: 180.0.w,
                      height: 2.0.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    SizedBox(height: AppSizes.lg),

                    // Subtitle
                    AppText(
                      "Your Ultimate Sports Destination",
                      style: TextStyle(
                        fontSize: AppSizes.bodyLg,
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                      ),
                      align: TextAlign.center,
                    ),
                    SizedBox(height: AppSizes.xxl * 1.5),

                    // Initialising Progress
                    Column(
                      children: [
                        AppText(
                          "INITIALISING",
                          style: TextStyle(
                            fontSize: AppSizes.bodyMd,
                            color: Colors.white70,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: AppSizes.sm),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.screenPadding * 2,
                          ),
                          child: Obx(
                            () => Column(
                              children: [
                                LinearProgressIndicator(
                                  borderRadius: AppRadius.allMd,
                                  value: controller.progress.value / 100,
                                  minHeight: 8,
                                  backgroundColor: Colors.white.withOpacity(
                                    0.2,
                                  ),
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                ),
                                SizedBox(height: AppSizes.xs),
                                AppText(
                                  "${controller.progress.value.toInt()}%",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AppSizes.bodyMd,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Bottom icons (mock navigation bar)
              Positioned(
                bottom: AppSizes.screenPadding,
                left: 0,
                right: 0,
                child: Center(
                  child: WaveLoadingIcons(
                    controller: controller.waveController,
                    iconSize: 22,
                    spacing: 18,
                    iconColor: Colors.white.withOpacity(0.75),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
