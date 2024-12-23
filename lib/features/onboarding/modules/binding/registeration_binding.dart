// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:project_tribe/features/onboarding/modules/controller/registeration_controller.dart';

class RegisterationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegisterationController());
  }
}
