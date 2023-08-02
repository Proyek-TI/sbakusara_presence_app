import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AdminDashboardController extends GetxController {
  int selectedIndex = 0;

  List<Widget> pages = [
    const Text('Page 1'),
    const Text('Page 2'),
    const Text('Page 3'),
  ];

  void currentIndex(int index) {
    selectedIndex = index;
    update();
  }
}
