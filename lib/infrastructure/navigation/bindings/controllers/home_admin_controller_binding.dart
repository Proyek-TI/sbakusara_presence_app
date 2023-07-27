import 'package:get/get.dart';

import '../../../../presentation/home_admin/controllers/home_admin_controller.dart';

class HomeAdminControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeAdminController>(
      () => HomeAdminController(),
    );
  }
}
