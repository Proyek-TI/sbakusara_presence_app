import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  static final LocationService _locationService = LocationService._internal();
  factory LocationService() {
    return _locationService;
  }
  LocationService._internal();

  Future<bool> _handlerLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      //
      debugPrint("service is disable");
      //
      AppSettings.openAppSettings(type: AppSettingsType.location);
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      //
      debugPrint("service was denied");
      //
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      //
      debugPrint("service denied forever");
      //
      await Geolocator.openAppSettings().then((value) async {
        permission = await Geolocator.requestPermission();
      });

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return false;
      }
    }

    return true;
  }

  Future<Position?> getUserLocation() async {
    final hasPermission = await _handlerLocationPermission();
    if (hasPermission) {
      try {
        final position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        return position;
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    return null;
  }
}
