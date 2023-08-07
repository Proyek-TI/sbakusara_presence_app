import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sbakusara_presence_app/data/models/presence_history_model.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_color_styles.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_text_styles.dart';
import 'package:sbakusara_presence_app/presentation/admin_history/controllers/admin_history_controller.dart';

class AdminDetailPresence extends GetView<AdminHistoryController> {
  AdminDetailPresence({
    super.key,
    required this.index,
    required this.presence,
  });

  @override
  final AdminHistoryController controller = Get.put(AdminHistoryController());

  final int index;
  final PresenceModel presence;

  @override
  Widget build(BuildContext context) {
    List<String> urlList = jsonDecode(presence.url!).cast<String>() ?? '';
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColorStyle.bgColormain,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColorStyle.textColorblack,
          ),
        ),
        centerTitle: true,
        titleSpacing: 0,
        title: Text(
          "${presence.user!.username!}'s Detail",
          style: AppTextStyle.appBarTitleStyle.copyWith(
            color: AppColorStyle.textColorblack,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: AppColorStyle.primary100,
                child: IconButton(
                  onPressed: () async {
                    await controller.openMap(
                      latitude: double.parse(presence.latitude!),
                      longitude: double.parse(presence.longitude!),
                      location: presence.location ?? 'Unknown Location',
                    );
                  },
                  icon: const Icon(
                    Icons.location_on_sharp,
                    size: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                presence.location ?? 'Unknown Location',
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  urlList[0].isNotEmpty
                      ? Image.network(
                          urlList[0],
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.image);
                          },
                        )
                      : const SizedBox.shrink(),
                  urlList.length != 1
                      ? Image.network(
                          urlList[1],
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.image);
                          },
                        )
                      : const SizedBox.shrink(),
                ],
              ),

              // Expanded(
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     itemCount: urlList.length,
              //     itemBuilder: (context, index) {
              //       return Image.network(
              //         urlList[index],
              //         errorBuilder: (context, error, stackTrace) {
              //           return const Icon(Icons.image);
              //         },
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
