import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/home_user_controller.dart';

class HomeUserScreen extends GetView<HomeUserController> {
  const HomeUserScreen({Key? key}) : super(key: key);
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
