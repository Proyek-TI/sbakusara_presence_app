import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/home_admin_controller.dart';

class HomeAdminScreen extends GetView<HomeAdminController> {
  const HomeAdminScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeUserScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HomeUserScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
