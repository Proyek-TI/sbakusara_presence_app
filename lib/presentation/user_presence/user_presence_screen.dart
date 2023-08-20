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
            GetBuilder<UserPresenceController>(
              builder: (controller) => Text(
                controller.homeWidget.checkIn?.time == 'belum absen' &&
                        controller.homeWidget.checkOut?.time == 'belum absen'
                    ? 'Ambil foto terbaikmu hari ini, semoga harimu menyenangkan'
                    : 'Terima kasih atas kerja kerasmu hari ini, selamat beristirahat',
                style: AppTextStyle.dateTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            GetBuilder<UserPresenceController>(
              builder: (controller) => OutlinedButton(
                onPressed: () async {
                  if (controller.willUploadedImages.length <= 1) {
                    await controller.selectImage();
                  } else {
                    null;
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
                return controller.willUploadedImages.isEmpty
                    ? Text(
                        controller.homeWidget.checkIn?.time == 'belum absen' &&
                                controller.homeWidget.checkOut?.time ==
                                    'belum absen'
                            ? 'Belum ada foto terpilih,\nAyo ambil foto-foto terbaikmu hari ini'
                            : 'Belum ada foto terpilih,\nAyo ambil foto-foto kegiatanmu hari ini',
                        style: AppTextStyle.dateTextStyle
                            .copyWith(color: AppColorStyle.textColorgrey),
                        textAlign: TextAlign.center,
                      )
                    :
                    // pick image from camera
                    SizedBox(
                        height: 80,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.willUploadedImages.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 12),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Stack(
                                  children: [
                                    Image.file(
                                      controller.willUploadedImages[index],
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
                    if (controller.selectedImages.length <= 2) {
                      await controller.createPresence();
                    } else {
                      Get.snackbar('Tidak bisa melakukan presensi',
                          'Gambarnya cukup 2 saja ya!');
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
                return controller.willUploadedImages.isNotEmpty &&
                        controller.willUploadedImages.length < 2
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
