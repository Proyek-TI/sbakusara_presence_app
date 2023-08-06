import 'package:get/get.dart';
import 'package:sbakusara_presence_app/data/models/presence_history_model.dart';
import 'package:sbakusara_presence_app/data/services/address_service.dart';
import 'package:sbakusara_presence_app/data/services/api_service.dart';
import 'package:map_launcher/map_launcher.dart';

class UserHistoryController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getUserPresenceHistory();
  }

  final apiService = ApiServices();
  final addressService = AddressService();

  // filter data
  String selectedPeriod = "";

  List<PresenceModel> presenceHistory = [];

  // get location name
  String title = "Lokasi saya";

  double latitude = 0;
  double longitude = 0;

  /// open map and show location
  Future<void> openMap(
      {required double latitude,
      required double longitude,
      required String location}) async {
    final availableMaps = await MapLauncher.installedMaps;
    await availableMaps.first.showMarker(
      coords: Coords(latitude, longitude),
      title: location,
    );
  }

  /// get location name n other info
  Future<void> getAddress(double latitude, double longitude) async {
    final response =
        await addressService.getAddressFromLatLng(latitude, longitude);
    title = response;
    update();
  }

  Future<String> getAddressForEachWidget(
      double latitude, double longitude) async {
    final response =
        await addressService.getAddressFromLatLng(latitude, longitude);
    return response;
  }

  /// get presence history
  Future<void> getUserPresenceHistory() async {
    final response = await apiService.getPresenceHistory(selectedPeriod);
    presenceHistory = response;
    update();
  }

  /// change period {daily, weekly, monthly}
  void changePeriod(String newSelectedPeriod) {
    selectedPeriod = newSelectedPeriod;
    update();
    getUserPresenceHistory();
  }
}
