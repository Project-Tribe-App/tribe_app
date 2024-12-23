// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:project_tribe/core/tribe_color.dart';
import 'package:project_tribe/features/onboarding/modules/controller/registeration_controller.dart';

class RegisterPlane extends StatelessWidget {
  const RegisterPlane({required this.controller, required this.formKey, super.key});

  final RegisterationController controller;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
          width: 0.8.sw,
          height: 0.3.sh,
          decoration: BoxDecoration(
            border: Border.all(color: TribeColor.primaryColor, width: 1.5),
            borderRadius: BorderRadius.circular(20.r),
            gradient: LinearGradient(
              colors: [
                // ignore: deprecated_member_use
                TribeColor.secondaryColor.withOpacity(0.9), // Increased opacity
                // ignore: deprecated_member_use
                TribeColor.primaryColor.withOpacity(0.3),
              ],
              tileMode: TileMode.clamp,
              transform: const GradientRotation(0.5),
            ),
          ),
          child: Obx(() {
            return Column(
              children: [
                Visibility(
                  visible: controller.currentIndex.value == 0,
                  child: Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 40.h), // Spacing
                        Container(
                          width: 0.7.sw,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: TribeColor.primaryColor,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: TextFormField(
                            controller: controller.nameController,
                            keyboardType: TextInputType.name,
                            style: TextStyle(
                              color: TribeColor.white,
                              fontSize: 15.sp, // Matches hint text style
                            ),
                            cursorHeight: 20.h, // Adjust cursor height if necessary
                            decoration: InputDecoration(
                              hintText: 'Name',
                              hintStyle: TextStyle(
                                color: TribeColor.white,
                                fontSize: 14.sp,
                              ),
                              border: InputBorder.none,
                              isDense: true, // Reduces vertical padding
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, // Ensures hint text and cursor alignment
                              ),
                              icon: Padding(
                                padding: EdgeInsets.only(left: 5.w), // Adds spacing
                                child: Icon(
                                  Icons.person,
                                  color: TribeColor.white,
                                  size: 18.sp,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Name cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20.h), // Spacing
                        Container(
                          width: 0.7.sw,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: TribeColor.primaryColor,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: TextFormField(
                            controller: controller.userNameController,
                            style: TextStyle(
                              color: TribeColor.white,
                              fontSize: 15.sp, // Matches hint text style
                            ),
                            cursorHeight: 20.h, // Adjust cursor height if necessary
                            decoration: InputDecoration(
                              hintText: 'Username',
                              hintStyle: TextStyle(
                                color: TribeColor.white,
                                fontSize: 14.sp,
                              ),
                              border: InputBorder.none,
                              isDense: true, // Reduces vertical padding
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, // Ensures hint text and cursor alignment
                              ),
                              icon: Padding(
                                padding: EdgeInsets.only(left: 5.w), // Adds spacing
                                child: Icon(
                                  Icons.account_box,
                                  color: TribeColor.white,
                                  size: 18.sp,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'User name cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        const Spacer(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              radius: 20.w,
                              backgroundColor:
                                  // ignore: deprecated_member_use
                                  TribeColor.primaryColor.withOpacity(0.5),
                              child: IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    controller.changeIndex(1);
                                  }
                                },
                                icon: Icon(
                                  Icons.chevron_right_rounded,
                                  size: 25.w,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w), // Spacing
                          ],
                        ),
                        SizedBox(height: 10.h), // Spacing
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: controller.currentIndex.value == 1,
                  child: Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 40.h), // Spacing
                        Container(
                          width: 0.7.sw,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: TribeColor.primaryColor,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: TextFormField(
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                              color: TribeColor.white,
                              fontSize: 15.sp, // Matches hint text style
                            ),
                            cursorHeight: 20.h, // Adjust cursor height if necessary
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                color: TribeColor.white,
                                fontSize: 14.sp,
                              ),
                              border: InputBorder.none,
                              isDense: true, // Reduces vertical padding
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, // Ensures hint text and cursor alignment
                              ),
                              icon: Padding(
                                padding: EdgeInsets.only(left: 5.w), // Adds spacing
                                child: Icon(
                                  Icons.email_rounded,
                                  color: TribeColor.white,
                                  size: 18.sp,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20.h), // Spacing
                        Container(
                          width: 0.7.sw,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: TribeColor.primaryColor,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: TextFormField(
                            controller: controller.phoneController,
                            keyboardType: TextInputType.phone,
                            style: TextStyle(
                              color: TribeColor.white,
                              fontSize: 15.sp, // Matches hint text style
                            ),
                            cursorHeight: 20.h, // Adjust cursor height if necessary
                            decoration: InputDecoration(
                              hintText: 'Phone number',
                              hintStyle: TextStyle(
                                color: TribeColor.white,
                                fontSize: 14.sp,
                              ),
                              border: InputBorder.none,
                              isDense: true, // Reduces vertical padding
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, // Ensures hint text and cursor alignment
                              ),
                              icon: Padding(
                                padding: EdgeInsets.only(left: 5.w), // Adds spacing
                                child: Icon(
                                  Icons.phone,
                                  color: TribeColor.white,
                                  size: 18.sp,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Phone number cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        const Spacer(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(width: 10.w), // Spacing
                            CircleAvatar(
                              radius: 20.w,
                              backgroundColor:
                                  // ignore: deprecated_member_use
                                  TribeColor.primaryColor.withOpacity(0.5),
                              child: IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  controller.changeIndex(0);
                                },
                                icon: Icon(
                                  Icons.chevron_left_rounded,
                                  size: 25.w,
                                ),
                              ),
                            ),
                            const Spacer(),
                            CircleAvatar(
                              radius: 20.w,
                              backgroundColor:
                                  // ignore: deprecated_member_use
                                  TribeColor.primaryColor.withOpacity(0.5),
                              child: IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    controller.changeIndex(2);
                                  }
                                },
                                icon: Icon(
                                  Icons.chevron_right_rounded,
                                  size: 25.w,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w), // Spacing
                          ],
                        ),
                        SizedBox(height: 10.h), // Spacing
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: controller.currentIndex.value == 2,
                  child: Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 30.h), // Spacing
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: CSCPicker(
                            layout: Layout.vertical,
                            disabledDropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade700),
                            ),
                            selectedItemStyle: TextStyle(
                              color: TribeColor.white,
                              fontSize: 14.sp,
                            ),
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.w),
                              border: Border.all(color: TribeColor.primaryColor, width: 1.5.w),
                            ),
                            dropdownDialogRadius: 10,
                            searchBarRadius: 10,
                            defaultCountry: CscCountry.India,
                            onCountryChanged: (value) {
                              controller.selectedCountry.value = value;
                              controller.update();
                            },
                            onStateChanged: (value) {
                              controller.selectedState.value = value ?? '';
                              controller.update();
                            },
                            onCityChanged: (value) {
                              controller.selectedCity.value = value ?? '';
                              controller.update();
                            },
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(width: 10.w), // Spacing
                            CircleAvatar(
                              radius: 20.w,
                              backgroundColor:
                                  // ignore: deprecated_member_use
                                  TribeColor.primaryColor.withOpacity(0.5),
                              child: IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  controller.changeIndex(1);
                                },
                                icon: Icon(
                                  Icons.chevron_left_rounded,
                                  size: 25.w,
                                ),
                              ),
                            ),
                            const Spacer(),
                            CircleAvatar(
                              radius: 20.w,
                              backgroundColor:
                                  // ignore: deprecated_member_use
                                  TribeColor.primaryColor.withOpacity(0.5),
                              child: IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  if (controller.selectedCountry.value.isNotEmpty &&
                                      controller.selectedCity.value.isNotEmpty &&
                                      controller.selectedState.value.isNotEmpty) {
                                    controller.changeIndex(3);
                                  }
                                },
                                icon: Icon(
                                  Icons.chevron_right_rounded,
                                  size: 25.w,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w), // Spacing
                          ],
                        ),
                        SizedBox(height: 10.h), // Spacing
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: controller.currentIndex.value == 3,
                  child: Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 40.h), // Spacing
                        Container(
                          width: 0.7.sw,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: TribeColor.primaryColor,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: TextFormField(
                            controller: controller.passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            style: TextStyle(
                              color: TribeColor.white,
                              fontSize: 14.sp, // Matches hint text style
                            ),
                            obscureText: !controller.isPasswordVisible.value,
                            cursorHeight: 20.h, // Adjust cursor height if necessary
                            decoration: InputDecoration(
                              hintText: 'Set Password',
                              hintStyle: TextStyle(
                                color: TribeColor.white,
                                fontSize: 14.sp,
                              ),
                              border: InputBorder.none,
                              isDense: true, // Reduces vertical padding
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, // Ensures hint text and cursor alignment
                              ),
                              icon: Padding(
                                padding: EdgeInsets.only(left: 5.w), // Adds spacing
                                child: Icon(
                                  Icons.password_sharp,
                                  color: TribeColor.white,
                                  size: 18.sp,
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                                  size: 18.sp,
                                ),
                                onPressed: () {
                                  controller.togglePasswordVisibility();
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),

                        SizedBox(height: 20.h), // Spacing
                        Container(
                          width: 0.7.sw,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: TribeColor.primaryColor,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: TextFormField(
                            controller: controller.confirmPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: !controller.isPasswordVisible.value,
                            style: TextStyle(
                              color: TribeColor.white,
                              fontSize: 15.sp, // Matches hint text style
                            ),
                            cursorHeight: 20.h, // Adjust cursor height if necessary
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              hintStyle: TextStyle(
                                color: TribeColor.white,
                                fontSize: 14.sp,
                              ),
                              border: InputBorder.none,
                              isDense: true, // Reduces vertical padding
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, // Ensures hint text and cursor alignment
                              ),
                              icon: Padding(
                                padding: EdgeInsets.only(left: 5.w), // Adds spacing
                                child: Icon(
                                  Icons.security_sharp,
                                  color: TribeColor.white,
                                  size: 18.sp,
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                                  size: 18.sp,
                                ),
                                onPressed: () {
                                  controller.togglePasswordVisibility();
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),

                        const Spacer(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(width: 10.w), // Spacing
                            CircleAvatar(
                              radius: 20.w,
                              backgroundColor:
                                  // ignore: deprecated_member_use
                                  TribeColor.primaryColor.withOpacity(0.5),
                              child: IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  controller.changeIndex(2);
                                },
                                icon: Icon(
                                  Icons.chevron_left_rounded,
                                  size: 25.w,
                                ),
                              ),
                            ),
                            const Spacer(),
                            SizedBox(width: 10.w), // Spacing
                          ],
                        ),
                        SizedBox(height: 10.h), // Spacing
                      ],
                    ),
                  ),
                ),
              ],
            );
          })),
    );
  }
}
