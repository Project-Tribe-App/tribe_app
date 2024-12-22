import 'package:get/get.dart';
import 'package:project_tribe/core/routing/routes.dart';
import 'package:project_tribe/features/onboarding/modules/binding/registeration_binding.dart';
import 'package:project_tribe/features/onboarding/presentation/screens/register.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: Register.new,
      binding: RegisterationBinding(),
    ),
  ];
}
