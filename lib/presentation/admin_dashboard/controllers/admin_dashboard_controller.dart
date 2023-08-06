import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sbakusara_presence_app/presentation/screens.dart';

class AdminDashboardController extends GetxController {
  int selectedIndex = 0;

  List<Widget> pages = [
    const AdminHomeScreen(),
    const Text('Page 2'),
    const Text('Page 3'),
  ];

  void currentIndex(int index) {
    selectedIndex = index;
    update();
  }
}
