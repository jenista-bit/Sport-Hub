import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  final RxList<String> selectedRoles = <String>[].obs;

  final fullNameController = TextEditingController();
  final favoriteSportsController = TextEditingController();

  final RxBool showRoleError = false.obs;

  final ScrollController scrollController = ScrollController();

  final roleKey = GlobalKey();
  final fullNameKey = GlobalKey();

  void toggleRole(String role) {
    if (selectedRoles.contains(role)) {
      selectedRoles.remove(role);
    } else {
      selectedRoles.add(role);
    }

    if (selectedRoles.isNotEmpty) {
      showRoleError.value = false;
    }
  }

  bool validateRole() {
    showRoleError.value = false;

    if (selectedRoles.isEmpty) {
      showRoleError.value = true;
      return false;
    }

    return true;
  }

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        alignment: 0.2,
      );
    }
  }

  void submitStep1(GlobalKey<FormState> formKey) {
    final formValid = formKey.currentState?.validate() ?? false;
    final roleValid = validateRole();

    if (!formValid) {
      scrollTo(fullNameKey);
      return;
    }

    if (!roleValid) {
      scrollTo(roleKey);
      return;
    }

    Get.toNamed('/create-step2');
  }

  @override
  void onClose() {
    fullNameController.dispose();
    favoriteSportsController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}