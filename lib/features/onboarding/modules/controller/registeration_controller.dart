
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}