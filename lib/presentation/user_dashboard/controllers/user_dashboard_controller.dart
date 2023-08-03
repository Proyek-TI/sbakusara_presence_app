import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sbakusara_presence_app/presentation/screens.dart';

class UserDashboardController extends GetxController {
  int selectedIndex = 0;

  List<Widget> pages = [
    UserHomeScreen(),
    const UserHistoryScreen(),
    SettingsScreen(),
  ];

  void currentIndex(int index) {
    selectedIndex = index;
    update();
  }
}
