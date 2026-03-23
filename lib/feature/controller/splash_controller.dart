import 'dart:async';
import 'package:flutter/material.dart';
import 'package:future_hub/route/app_route.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {

  final progress = 0.0.obs;

  late AnimationController waveController;

  @override
  void onInit() {
    super.onInit();

    waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);

    _simulateLoading();
  }

  void _simulateLoading() {
    Timer.periodic(const Duration(milliseconds: 60), (timer) {
      if (progress.value < 100) {
        progress.value += 2;
      } else {
        timer.cancel();
        _navigateToNextScreen();
      }
    });
  }

 void _navigateToNextScreen() {
  waveController.stop(); // แค่ stop พอ

  Future.delayed(const Duration(milliseconds: 300), () {
    Get.offAllNamed(AppRoutes.login);
  });
}

@override
void onClose() {
  waveController.dispose();
  super.onClose();
}}