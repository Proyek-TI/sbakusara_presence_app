import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  const EnvironmentsBadge({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.production
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.qas ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.homeUser,
      page: () => HomeUserScreen(),
      binding: HomeUserControllerBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.splash,
      page: () => SplashScreen(),
      binding: SplashControllerBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.auth,
      page: () => AuthScreen(),
      binding: AuthControllerBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.homeAdmin,
      page: () => const HomeAdminScreen(),
      binding: HomeAdminControllerBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.dashboardUser,
      page: () => const DashboardUserScreen(),
      binding: DashboardUserControllerBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
