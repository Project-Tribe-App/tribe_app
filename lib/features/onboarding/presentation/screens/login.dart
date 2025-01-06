// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

// Project imports:
import 'package:project_tribe/core/tribe_color.dart';
import 'package:project_tribe/features/onboarding/modules/controller/login_controller.dart';
import 'package:project_tribe/features/onboarding/presentation/screens/register.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Lottie Animation as Background
          SizedBox.expand(
            child: Lottie.asset(
              'assets/animations/bg_animation.json',
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
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  color: Colors.transparent,
                  child: Container(
                    width: 0.8.sw,
                    height: 0.3.sh,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      gradient: LinearGradient(
                        colors: [
                          // ignore: deprecated_member_use
                          TribeColor.secondaryColor.withOpacity(0.7), // Increased opacity
                          // ignore: deprecated_member_use
                          TribeColor.primaryColor.withOpacity(0.2),
                        ],
                        tileMode: TileMode.clamp,
                        transform: const GradientRotation(0.5),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Form(
                        key: formKey,
                        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                          TextFormField(
                            controller: controller.emailController,
                            decoration: InputDecoration(
                              hintText: 'Username or Email',
                              hintStyle: const TextStyle(color: TribeColor.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: TribeColor.primaryColor.withOpacity(0.4),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email or Username is required.';
                              }
                              if (value.length < 8) {
                                return 'Invalid Email or Username.';
                              }
                              return null;
                            },
                            style: const TextStyle(color: TribeColor.white),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Obx(() {
                            return TextFormField(
                                controller: controller.passwordController,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: const TextStyle(color: TribeColor.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: TribeColor.primaryColor.withOpacity(0.4),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      controller.togglePasswordVisibility();
                                    },
                                    icon: Icon(
                                      controller.isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                                      color: TribeColor.white,
                                    ),
                                  ),
                                ),
                                style: const TextStyle(color: TribeColor.white),
                                obscureText: !controller.isPasswordVisible.value,
                                validator: (value) {
                                  if (!validatePassword()) {
                                    return 'Password Not Valid';
                                  } else {
                                    return null;
                                  }
                                });
                          }),
                          SizedBox(
                            height: 10.h,
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await controller.loginUser();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: TribeColor.primaryColor.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: TribeColor.white,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No account? ',
                      style: TextStyle(color: TribeColor.white, fontSize: 14.sp),
                    ),
                    SizedBox(width: 5.w),
                    GestureDetector(
                      onTap: () {
                        Get.off(() => Register());
                      },
                      child: Text(
                        'Signup',
                        style: TextStyle(color: TribeColor.primaryColor, fontSize: 14.sp),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'or login with ',
                  style: TextStyle(color: TribeColor.white, fontSize: 14.sp),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 70.w,
                      height: 70.h,
                      child: Lottie.asset(
                        'assets/animations/google_icon.json',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 70.w),
                    SizedBox(
                      width: 60.w,
                      height: 60.h,
                      child: Lottie.asset(
                        'assets/animations/facebook_icon.json',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
        ],
      ),
    );
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
