import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sbakusara_presence_app/presentation/screens.dart';

class AdminDashboardController extends GetxController {
  int selectedIndex = 0;

  List<Widget> pages = [
    AdminHomeScreen(),
    AdminHistoryScreen(),
    SettingsScreen(),
  ];

  void currentIndex(int index) {
    selectedIndex = index;
    update();
  }
}
