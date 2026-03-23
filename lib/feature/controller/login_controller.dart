// features/auth/presentation/controllers/login_controller.dart
import 'package:flutter/material.dart';
import 'package:future_hub/route/app_route.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final phoneController = TextEditingController();
  final emailController = TextEditingController(); // เก็บไว้ถ้าต้องการ fallback
  final passwordController = TextEditingController();
  var isLoading = false.obs;

  Future<void> loginWithPhone() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    final phone = phoneController.text.trim();
    if (phone.isEmpty || phone.length < 9) {
      Get.snackbar('Error', 'กรุณากรอกเบอร์โทรศัพท์ให้ครบถ้วน');
      isLoading.value = false;
      return;
    }
    Get.snackbar('Success (Mock)', 'ส่ง OTP ไปที่ $phone แล้ว');
    // จริง ๆ ควรไปหน้า OTP verification
    Get.toNamed(AppRoutes.verifyPhonePage, arguments: phone);
    isLoading.value = false;
  }


  @override
  void onClose() {
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
