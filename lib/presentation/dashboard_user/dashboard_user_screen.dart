import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/dashboard_user_controller.dart';

class DashboardUserScreen extends GetView<DashboardUserController> {
  const DashboardUserScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashboardUserScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DashboardUserScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
