// ignore_for_file: unnecessary_null_comparison

import 'package:geocoding/geocoding.dart';

class AddressService {
  Future<String> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks != null && placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        return "${place.locality}, ${place.administrativeArea}, ${place.country}";
      }
    } catch (e) {
      throw e.toString();
    }
    return "Unknown Location";
  }
}
