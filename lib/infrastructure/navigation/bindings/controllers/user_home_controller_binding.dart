import 'package:get/get.dart';

import '../../../../presentation/user_home/controllers/user_home_controller.dart';

class UserHomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserHomeController>(
      () => UserHomeController(),
    );
  }
}
