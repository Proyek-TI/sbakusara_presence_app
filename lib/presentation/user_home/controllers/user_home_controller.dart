// ignore_for_file: unnecessary_null_comparison

import 'package:get/get.dart';
import 'package:sbakusara_presence_app/data/models/home_model.dart';
import 'package:sbakusara_presence_app/data/services/address_service.dart';
import 'package:sbakusara_presence_app/data/services/api_service.dart';
import 'package:map_launcher/map_launcher.dart';

class UserHomeController extends GetxController {
  @override
  void onInit() async {
    super.onInit();

    await getHomeWidget();
    await getAddress();
  }

  final apiServices = ApiServices();
  final addressService = AddressService();
  HomeModel homeWidget = HomeModel();

  final coords = Coords(-6.707629, 108.4767248);
  String title = "Lokasi saya";

  /// get home check in n check out info
  Future<void> getHomeWidget() async {
    final response = await apiServices.getHomeWidget();
    homeWidget = response;
    update();
  }

  /// open map and show location
  Future<void> openMap() async {
    final availableMaps = await MapLauncher.installedMaps;
    await availableMaps.first.showMarker(
      coords: coords,
      title: title,
    );
  }

  /// get location name n other info
  // Future<String> getAddressFromLatLng(double latitude, double longitude) async {
  //   try {
  //     List<Placemark> placemarks =
  //         await placemarkFromCoordinates(-6.707629, 108.4767248);
  //     if (placemarks != null && placemarks.isNotEmpty) {
  //       Placemark place = placemarks[0];
  //       return "${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
  //     }
  //   } catch (e) {
  //     throw e.toString();
  //   }
  //   return "Unknown Location";
  // }

  /// get location name n other info
  Future<void> getAddress() async {
    final response =
        await addressService.getAddressFromLatLng(-6.707629, 108.4767248);
    title = response;
    update();
  }
}
