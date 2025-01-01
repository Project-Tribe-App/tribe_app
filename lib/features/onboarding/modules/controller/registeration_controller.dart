// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:project_tribe/core/utils/utility.dart';
import 'package:project_tribe/features/onboarding/modules/model/registeration_model.dart';
import 'package:project_tribe/features/onboarding/modules/service/onboarding_service.dart';

class RegisterationController extends GetxController {
  final RxInt currentIndex = 0.obs;
  final RxBool isPasswordVisible = false.obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final RxString selectedCountry = ''.obs;
  final RxString selectedCity = ''.obs;
  final RxString selectedState = ''.obs;
  final OnboardingService registrationService = OnboardingService();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  Future<void> registerUser() async {
    final data = RegistrationModel(
      name: nameController.text,
      username: userNameController.text,
      email: emailController.text,
      password: passwordController.text,
      phoneNumber: int.parse(phoneController.text),
      city: selectedCity.value,
      state: selectedState.value,
      country: selectedCountry.value,
    ).toJson();
    try {
      Utility.showLoadingDialog(Get.context!);
      final respose = await registrationService.registerUser(data);
      if (respose.statusCode == 200) {
        Utility.closeDialog();
        Utility.showSuccessToast(title: 'Success', context: Get.context!, description: 'User registered successfully.');
      } else if (respose.statusCode == 409) {
        Utility.closeDialog();
        Utility.showErrorToast(title: 'Error', context: Get.context!, description: 'User already exists.');
      } else if (respose.statusCode == 400) {
        Utility.closeDialog();
        Utility.showErrorToast(
            title: 'Error', context: Get.context!, description: 'Registration failed, please try again.');
      } else {
        Utility.closeDialog();
        Utility.showErrorToast(
            title: 'Error', context: Get.context!, description: 'Some issue from our side, please try again.');
      }
    } catch (e) {
      Utility.closeDialog();
      Utility.showErrorToast(
          title: 'Error', context: Get.context!, description: 'Some issue from our side, please try again.');
      debugPrint('Error: $e');
    }
  }
}
