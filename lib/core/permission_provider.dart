import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

final class PermissionProvider {
  PermissionProvider(this._geolocatorService);

  final GeolocatorPlatform _geolocatorService;

  Future<bool> handleGeolocaitonPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await _geolocatorService.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    permission = await _geolocatorService.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorService.requestPermission();

      if (!kReleaseMode) {
        log('Permission is $permission');
      }

      if (permission == LocationPermission.denied) {
        return false;
      }
    } else {
      if (!kReleaseMode) {
        log('Permission is $permission');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }
}
