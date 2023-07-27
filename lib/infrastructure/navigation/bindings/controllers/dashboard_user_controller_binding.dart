import 'package:get/get.dart';

import '../../../../presentation/dashboard_user/controllers/dashboard_user_controller.dart';

class DashboardUserControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardUserController>(
      () => DashboardUserController(),
    );
  }
}
