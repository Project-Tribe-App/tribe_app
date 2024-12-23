// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:project_tribe/core/tribe_color.dart';
import 'package:project_tribe/features/onboarding/modules/controller/registeration_controller.dart';
import 'package:project_tribe/features/onboarding/presentation/widgets/register_plane.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final RegisterationController controller = Get.put(RegisterationController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 1.sh,
        ),
        child: Container(
            height: 1.sh,
            width: 1.sw,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/tribe_bg_2.jpg'),
                fit: BoxFit.fill,
              ),
            ),
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
                          if (formKey.currentState!.validate()) {
                            await controller.registerUser();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TribeColor.primaryColor.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
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
                  height: 100.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(color: TribeColor.white, fontSize: 14.sp),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Login',
                      style: TextStyle(color: TribeColor.primaryColor, fontSize: 14.sp),
                    )
                  ],
                ),
              ],
            )),
      ),
    ));
  }
}
