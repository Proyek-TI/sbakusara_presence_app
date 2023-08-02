import 'package:get/get.dart';

import '../../../../presentation/home/controllers/user_home_controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserHomeController>(
      () => UserHomeController(),
    );
  }
}
