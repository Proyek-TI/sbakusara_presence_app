import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_color_styles.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_text_styles.dart';

import 'controllers/user_presence_controller.dart';

class UserPresenceScreen extends GetView<UserPresenceController> {
  UserPresenceScreen({Key? key}) : super(key: key);

  @override
  final UserPresenceController controller = Get.put(UserPresenceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorStyle.bgColormain,
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
          'Presensi',
          style: AppTextStyle.appBarTitleStyle.copyWith(
            color: AppColorStyle.textColorblack,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 29,
            ),
            Text(
              'Ambil foto terbaikmu hari ini, semoga harimu menyenangkan',
              style: AppTextStyle.dateTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            GetBuilder<UserPresenceController>(
              builder: (controller) => OutlinedButton(
                onPressed: () {
                  if (controller.selectedImages.length >= 3) {
                    null;
                  } else {
                    controller.pickImages();
                  }
                },
                style: ButtonStyle(
                  side: const MaterialStatePropertyAll(
                    BorderSide(width: 2, color: AppColorStyle.primary500),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                child: Text(
                  'Ambil foto',
                  style: AppTextStyle.labelTextStyle
                      .copyWith(color: AppColorStyle.primary500),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            GetBuilder<UserPresenceController>(
              builder: (controller) {
                return controller.selectedImages.isEmpty
                    ? Text(
                        'Belum ada foto terpilih,\nAyo ambil foto-foto terbaikmu hari ini',
                        style: AppTextStyle.dateTextStyle
                            .copyWith(color: AppColorStyle.textColorgrey),
                        textAlign: TextAlign.center,
                      )
                    : SizedBox(
                        height: 80,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.selectedImages.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 12),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Stack(
                                  children: [
                                    Image.file(
                                      File(
                                        controller.selectedImages[index].path,
                                      ),
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                        padding: const EdgeInsets.only(
                                            left: 50, bottom: 20),
                                        onPressed: () {
                                          controller.deleteImages(index);
                                        },
                                        icon: const Icon(
                                          Icons.delete_forever_sharp,
                                          color: AppColorStyle.dangerColor500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
              },
            ),
            const SizedBox(
              height: 48,
            ),
            GetBuilder<UserPresenceController>(
              builder: (controller) => SizedBox(
                width: Get.width,
                height: 40,
                child: ElevatedButton(
                  onPressed: () async {
                    if (controller.selectedImages.length == 3) {
                      await controller.createPresence();
                    } else {
                      null;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColorStyle.primary500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Text(
                    'Tap untuk presensi',
                    style: AppTextStyle.labelTextStyle,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            GetBuilder<UserPresenceController>(
              builder: (controller) {
                return controller.selectedImages.length > 1 &&
                        controller.selectedImages.length < 3
                    ? Text(
                        'Tambah foto lagi untuk bisa melakukan presensi',
                        style: AppTextStyle.helperinfoStyle.copyWith(
                          color: AppColorStyle.dangerColor500,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
