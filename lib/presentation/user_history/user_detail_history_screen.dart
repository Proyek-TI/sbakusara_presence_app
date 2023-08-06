import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sbakusara_presence_app/data/models/presence_history_model.dart';
import 'package:sbakusara_presence_app/presentation/user_history/controllers/user_history_controller.dart';

class UserDetailPresence extends GetView<UserHistoryController> {
  UserDetailPresence({
    super.key,
    required this.index,
    required this.presence,
  });

  @override
  final UserHistoryController controller = Get.put(UserHistoryController());

  final int index;
  final PresenceModel presence;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              presence.id.toString(),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: presence.url!.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    '',
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.image);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
