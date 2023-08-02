import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/user_history_controller.dart';

class UserHistoryScreen extends GetView<UserHistoryController> {
  const UserHistoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'UserHistoryScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
