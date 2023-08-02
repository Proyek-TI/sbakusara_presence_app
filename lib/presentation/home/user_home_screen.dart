import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/user_home_controller.dart';

class UserHomeScreen extends GetView<UserHomeController> {
  const UserHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'UserHomeScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
