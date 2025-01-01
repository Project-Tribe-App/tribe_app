// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:project_tribe/core/tribe_color.dart';
import 'package:project_tribe/core/utils/utility.dart';
import 'package:project_tribe/features/onboarding/modules/controller/registeration_controller.dart';

class RegisterPlane extends StatefulWidget {
  const RegisterPlane({required this.controller, required this.formKey, super.key});

  final RegisterationController controller;
  final GlobalKey<FormState> formKey;

  @override

  State<RegisterPlane> createState() => _RegisterPlaneState();
}

class _RegisterPlaneState extends State<RegisterPlane> {
  bool _passwordFieldTouched = false;
  bool _confirmPasswordFieldTouched = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Card(
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
            child: Obx(() {
              return Column(
                children: [
                  Visibility(
                    visible: widget.controller.currentIndex.value == 0,
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
                              controller: widget.controller.nameController,
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
                                errorStyle: TextStyle(
                                  color: TribeColor.white,
                                  fontSize: 10.sp,
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
                                if (value == null || value.isEmpty) {
                                  return 'Name is required.';
                                }
                                if (value.length > 100) {
                                  return 'Name is too long.';
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
                              controller: widget.controller.userNameController,
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
                                errorStyle: TextStyle(
                                  color: TribeColor.white,
                                  fontSize: 10.sp,
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
                                  return 'User name is required.';
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
                                    TribeColor.primaryColor.withOpacity(0.3),
                                child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    if (widget.formKey.currentState!.validate()) {
                                      widget.controller.changeIndex(1);
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
                    visible: widget.controller.currentIndex.value == 1,
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
                              controller: widget.controller.emailController,
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
                                errorStyle: TextStyle(
                                  color: TribeColor.white,
                                  fontSize: 10.sp,
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
                                if (value == null || value.isEmpty) {
                                  return 'Email is required.';
                                }
                                final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                                if (!emailRegex.hasMatch(value)) {
                                  return 'Invalid email address.';
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
                              controller: widget.controller.phoneController,
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
                                errorStyle: TextStyle(
                                  color: TribeColor.white,
                                  fontSize: 10.sp,
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
                                if (value == null || value.isEmpty) {
                                  return 'Phone number is required.';
                                }
                                final phoneRegex = RegExp(r'^\d{10}$');
                                if (!phoneRegex.hasMatch(value)) {
                                  return 'Invalid phone number.';
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
                                    TribeColor.primaryColor.withOpacity(0.3),
                                child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    widget.controller.changeIndex(0);
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
                                    TribeColor.primaryColor.withOpacity(0.3),
                                child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    if (widget.formKey.currentState!.validate()) {
                                      widget.controller.changeIndex(2);
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
                    visible: widget.controller.currentIndex.value == 2,
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
                                widget.controller.selectedCountry.value = value;
                                widget.controller.update();
                              },
                              onStateChanged: (value) {
                                widget.controller.selectedState.value = value ?? '';
                                widget.controller.update();
                              },
                              onCityChanged: (value) {
                                widget.controller.selectedCity.value = value ?? '';
                                widget.controller.update();
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
                                    TribeColor.primaryColor.withOpacity(0.3),
                                child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    widget.controller.changeIndex(1);
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
                                    TribeColor.primaryColor.withOpacity(0.3),
                                child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    if (widget.controller.selectedCountry.value.isNotEmpty &&
                                        widget.controller.selectedCity.value.isNotEmpty &&
                                        widget.controller.selectedState.value.isNotEmpty) {
                                      widget.controller.changeIndex(3);
                                    } else {
                                      Utility.showErrorToast(context: context, title: "Please select all fields");
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
                    visible: widget.controller.currentIndex.value == 3,
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
                              controller: widget.controller.passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              style: TextStyle(
                                color: TribeColor.white,
                                fontSize: 14.sp, // Matches hint text style
                              ),
                              obscureText: !widget.controller.isPasswordVisible.value,
                              cursorHeight: 20.h, // Adjust cursor height if necessary
                              onChanged: (value) {
                                setState(() {
                                  _passwordFieldTouched = true;
                                });
                              },
                              decoration: InputDecoration(
                                hintText: 'Set Password',
                                errorStyle: TextStyle(
                                  color: TribeColor.white,
                                  fontSize: 10.sp,
                                ),
                                hintStyle: TextStyle(
                                  color: TribeColor.white,
                                  fontSize: 14.sp,
                                ),
                                border: InputBorder.none,
                                errorText: _passwordFieldTouched ? _validatePasswordErrorText() : null,
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
                                    widget.controller.isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                                    size: 18.sp,
                                  ),
                                  onPressed: () {
                                    widget.controller.togglePasswordVisibility();
                                  },
                                ),
                              ),
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
                              controller: widget.controller.confirmPasswordController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: !widget.controller.isPasswordVisible.value,
                              style: TextStyle(
                                color: TribeColor.white,
                                fontSize: 15.sp, // Matches hint text style
                              ),
                              cursorHeight: 20.h, // Adjust cursor height if necessary
                              onChanged: (value) {
                                setState(() {
                                  _confirmPasswordFieldTouched = true;
                                });
                              },
                              decoration: InputDecoration(
                                hintText: 'Confirm Password',
                                hintStyle: TextStyle(
                                  color: TribeColor.white,
                                  fontSize: 14.sp,
                                ),
                                errorStyle: TextStyle(
                                  color: TribeColor.white,
                                  fontSize: 10.sp,
                                ),
                                border: InputBorder.none,
                                errorText: _confirmPasswordFieldTouched ? _validateConfirmPasswordErrorText() : null,
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
                                    widget.controller.isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                                    size: 18.sp,
                                  ),
                                  onPressed: () {
                                    widget.controller.togglePasswordVisibility();
                                  },
                                ),
                              ),
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
                                    TribeColor.primaryColor.withOpacity(0.3),
                                child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    widget.controller.changeIndex(2);
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
      ),
    );
  }

  String? _validatePasswordErrorText() {
    final password = widget.controller.passwordController.text;

    if (password.isEmpty) {
      return 'Password is required.';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters long.';
    }
    if (password.contains(' ')) {
      return 'Password cannot contain whitespace.';
    }
    if (!_containsUppercase(password)) {
      return 'Password must contain at least one uppercase letter.';
    }
    if (!_containsLowercase(password)) {
      return 'Password must contain at least one lowercase letter.';
    }
    if (!_containsDigit(password)) {
      return 'Password must contain at least one digit.';
    }
    if (!_containsSpecialCharacter(password)) {
      return 'Password must contain at least one special character.';
    }
    return null;
  }

  String? _validateConfirmPasswordErrorText() {
    final confirmPassword = widget.controller.confirmPasswordController.text;
    final password = widget.controller.passwordController.text;

    if (confirmPassword.isEmpty) {
      return 'Confirm password is required.';
    }
    if (confirmPassword.contains(' ')) {
      return 'Confirm password cannot contain whitespace.';
    }
    if (confirmPassword != password) {
      return 'Passwords do not match.';
    }
    return null;
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
