
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_tribe/core/tribe_color.dart';
import 'package:project_tribe/features/onboarding/modules/controller/registeration_controller.dart';
import 'package:project_tribe/features/onboarding/presentation/widgets/register_plane.dart';
class Register extends StatelessWidget {

  Register({super.key});

  final RegisterationController controller = Get.put(RegisterationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      SingleChildScrollView(
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
            child: 
            Column(
              children: [
                SizedBox(
                  height: 0.25.sh,),
                RegisterPlane(controller: controller,),
                SizedBox(height: 10.h,),
                SizedBox(
                  height: 50.h,
                  child: Obx((){
                    return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 10.w, // Define width for each item
                              decoration: BoxDecoration(
                                color:  controller.currentIndex.value == 0 ? TribeColor.primaryColor : TribeColor.white,
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
                SizedBox(height: 100.h,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account? ', style: TextStyle(color: TribeColor.white, fontSize: 14.sp),),
                      SizedBox(width: 5.w),
                      Text('Login', style: TextStyle(color: TribeColor.primaryColor, fontSize: 14.sp),)
                    ],
                  )
              
                  
                    
                  
                
              ],
            )
          ),
        ),
      )
      
//       Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset(
//               'assets/images/tribe_bg_2.jpg',
//               fit: BoxFit.fill, // Ensures the image covers the screen
//             ),
//           ),

//           // Blur effect
          
          
//           Positioned(
//             top: 0.3.sh,
//             left: 0.1.sw,
//             right: 0.1.sw,
//             child: const RegisterPlane(),
//           ),
//           Positioned(
//   bottom: 0.33.sh,
//   left: 0.37.sw,
//   child: SizedBox(
//     height: 50.h, // Set height for the ListVie
//     width: 1.sw,
    
//     child: Center(
//       child: ListView.builder(
//         itemCount: 4,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: 8.w), // Add spacing
//             child: Container(
//               width: 8.w, // Define width for each item
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 shape: BoxShape.circle,
//               ),
//             ),
//           );
//         },
//       ),
//     ),
//   ),
// ),


//         ],
//       )
    );
  }
}