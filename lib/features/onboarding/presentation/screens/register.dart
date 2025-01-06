// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

// Project imports:
import 'package:project_tribe/core/tribe_color.dart';
import 'package:project_tribe/features/onboarding/modules/controller/registeration_controller.dart';
import 'package:project_tribe/features/onboarding/presentation/screens/login.dart';
import 'package:project_tribe/features/onboarding/presentation/widgets/register_plane.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final RegisterationController controller = Get.put(RegisterationController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        // Lottie Animation as Background
        SizedBox.expand(
          child: Lottie.asset(
            'assets/animations/bg_animation2.json',
            fit: BoxFit.cover,
          ),
        ),
        // Your Screen Content
        SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              SizedBox(
                height: 0.25.sh,
              ),
              RegisterPlane(
                controller: controller,
                formKey: formKey,
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 50.h,
                child: Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 10.w, // Define width for each item
                        decoration: BoxDecoration(
                          color: controller.currentIndex.value == 0 ? TribeColor.primaryColor : TribeColor.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 10.w), // Spacing
                      Container(
                        width: 10.w, // Define width for each item
                        decoration: BoxDecoration(
                          color: controller.currentIndex.value == 1 ? TribeColor.primaryColor : TribeColor.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 10.w), // Spacing
                      Container(
                        width: 10.w, // Define width for each item
                        decoration: BoxDecoration(
                          color: controller.currentIndex.value == 2 ? TribeColor.primaryColor : TribeColor.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 10.w), // Spacing
                      Container(
                        width: 10.w, // Define width for each item
                        decoration: BoxDecoration(
                          color: controller.currentIndex.value == 3 ? TribeColor.primaryColor : TribeColor.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  );
                }),
              ),
              Obx(() {
                return Visibility(
                  visible: controller.currentIndex.value == 3,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (validatePassword() && validatePasswords()) {
                          await controller.registerUser();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: TribeColor.primaryColor.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 10.h,
                        ),
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                            color: TribeColor.white,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(
                height: 80.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(color: TribeColor.white, fontSize: 14.sp),
                  ),
                  SizedBox(width: 5.w),
                  GestureDetector(
                    onTap: () {
                      Get.off(() => LoginScreen());
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: TribeColor.primaryColor, fontSize: 14.sp),
                    ),
                  )
                ],
              ),
            ],
          )),
        ),
      ],
    ));
  }

  bool validatePasswords() {
    final password = controller.passwordController.text;
    final confirmPassword = controller.confirmPasswordController.text;

    if (password.isEmpty || confirmPassword.isEmpty) {
      return false;
    }

    if (password != confirmPassword) {
      return false;
    }

    return true;
  }

  bool validatePassword() {
    final password = controller.passwordController.text;

    if (password.length < 8) {
      return false;
    }

    if (password.contains(' ')) {
      return false;
    }

    if (!_containsUppercase(password)) {
      return false;
    }

    if (!_containsLowercase(password)) {
      return false;
    }

    if (!_containsDigit(password)) {
      return false;
    }

    if (!_containsSpecialCharacter(password)) {
      return false;
    }

    return true;
  }

  bool _containsUppercase(String value) {
    return value.contains(RegExp('[A-Z]'));
  }

  bool _containsLowercase(String value) {
    return value.contains(RegExp('[a-z]'));
  }

  bool _containsDigit(String value) {
    return value.contains(RegExp('[0-9]'));
  }

  bool _containsSpecialCharacter(String value) {
    return value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }
}
