import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_tribe/features/onboarding/presentation/screens/register.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    ScreenUtil.init(context);
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        child: GetMaterialApp(
          title: 'Tribe',
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.black, // Pitch black background
            colorScheme: const ColorScheme.dark(
              primary: Colors.deepPurple, // Adjust as needed
            ),),
          home: Register(),
        
      ),
    );
  }
}
