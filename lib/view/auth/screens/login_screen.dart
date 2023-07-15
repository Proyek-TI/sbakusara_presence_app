import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginScreen extends GetView {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LoginScreenView is working',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
