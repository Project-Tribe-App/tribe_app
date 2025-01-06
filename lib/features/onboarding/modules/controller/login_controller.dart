// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:project_tribe/core/utils/utility.dart';
import 'package:project_tribe/features/onboarding/modules/model/login_model.dart';
import 'package:project_tribe/features/onboarding/modules/service/onboarding_service.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isPasswordVisible = false.obs;
  final OnboardingService onboardingService = OnboardingService();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> loginUser() async {
    final data = LoginModel(
      identifier: emailController.text,
      password: passwordController.text,
    ).toJson();

    try {
      Utility.showLoadingDialog(Get.context!);
      final respose = await onboardingService.loginUser(data);
      if (respose.statusCode == 200) {
        Utility.closeDialog();
        Utility.showSuccessToast(title: 'Success', context: Get.context!, description: 'User logged in successfully.');
      } else if (respose.statusCode == 404) {
        Utility.closeDialog();
        Utility.showErrorToast(title: 'Error', context: Get.context!, description: 'User not found.');
      } else if (respose.statusCode == 401) {
        Utility.closeDialog();
        Utility.showErrorToast(title: 'Error', context: Get.context!, description: 'Invalid Credentials, try again.');
      } else {
        Utility.closeDialog();
        Utility.showErrorToast(
            title: 'Error', context: Get.context!, description: 'Some issue from our side, please try again.');
        debugPrint(respose.body);
      }
    } catch (e) {
      Utility.closeDialog();
      Utility.showErrorToast(
          title: 'Error', context: Get.context!, description: 'Some issue from our side, please try again.');
      debugPrint('Error: $e');
    }
  }
}
