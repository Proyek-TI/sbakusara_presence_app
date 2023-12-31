import 'package:get/get.dart';

import '../../../../presentation/admin_home/controllers/admin_home_controller.dart';

class AdminHomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminHomeController>(
      () => AdminHomeController(),
    );
  }
}
