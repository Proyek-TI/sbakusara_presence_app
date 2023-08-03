import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_color_styles.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'controllers/user_dashboard_controller.dart';

class UserDashboardScreen extends GetView<UserDashboardController> {
  UserDashboardScreen({Key? key}) : super(key: key);

  @override
  final UserDashboardController controller = Get.put(UserDashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserDashboardController>(
        builder: (controller) => SafeArea(
          child: controller.pages[controller.selectedIndex],
        ),
      ),
      bottomNavigationBar: Container(
        height: 65,
        decoration: BoxDecoration(
          color: AppColorStyle.bgColormain,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: AppColorStyle.textColorblack.withOpacity(.1),
            ),
          ],
        ),
        child: SafeArea(
          child: GetBuilder<UserDashboardController>(
            builder: (controller) => GNav(
              tabMargin: const EdgeInsets.symmetric(horizontal: 16),
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: AppColorStyle.bgColormain,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 300),
              tabBackgroundColor: AppColorStyle.primary500,
              color: AppColorStyle.textColorgrey,
              tabs: const [
                GButton(
                  icon: Icons.home_filled,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.work_history,
                  text: 'History',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                ),
              ],
              selectedIndex: controller.selectedIndex,
              onTabChange: (index) {
                controller.currentIndex(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
