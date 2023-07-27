import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/auth_controller.dart';

class AuthScreen extends GetView<AuthController> {
   AuthScreen({Key? key}) : super(key: key);

  @override
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AuthScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AuthScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
