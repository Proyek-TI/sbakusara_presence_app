// ignore_for_file: unnecessary_null_comparison

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sbakusara_presence_app/data/services/api_service.dart';
import 'package:sbakusara_presence_app/data/services/location_service.dart';

class UserPresenceController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await getUserLocation();
  }

  final apiService = ApiServices();
  final locationService = LocationService();

  double? latitude;
  double? longitude;

  List<XFile> selectedImages = [];
  // List<String> selectedImages = [];

  /// pick multiple images from gallery
  void pickImages() async {
    final ImagePicker picker = ImagePicker();
    List<XFile>? pickedImages = await picker.pickMultiImage();
    if (pickedImages != null && pickedImages.isNotEmpty) {
      selectedImages.addAll(pickedImages);
      update();
    }
  }

  /// delete selected images
  void deleteImages(int index) {
    selectedImages.removeAt(index);
    update();
  }

  /// enable gps and get user location
  Future<void> getUserLocation() async {
    final location = await locationService.getUserLocation().then(
      (value) {
        if (value == null) {
          update();
        } else {
          return value;
        }
      },
    );
    if (location != null) {
      latitude = location.latitude;
      longitude = location.longitude;

      update();
    }
  }

  /// create presence
  Future<void> createPresence() async {
    await apiService.createPresence(
        latitude.toString(), longitude.toString(), selectedImages);
  }
}
