import 'package:get/get.dart';

import '../../../../presentation/admin_dashboard/controllers/admin_dashboard_controller.dart';

class AdminDashboardControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminDashboardController>(
      () => AdminDashboardController(),
    );
  }
}
