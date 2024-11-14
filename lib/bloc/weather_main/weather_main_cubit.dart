import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'weather_main_state.dart';

class MicroBettingTimerCubit extends Cubit<WeatherMainState> {
  MicroBettingTimerCubit() : super(const WeatherMainState()) {
    init();
  }

  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  FutureOr<void> init() async {
    final position = await _getCurrentPosition();
    log('_getCurrentPosition is $position'); // final service = WeatherServiceImpl(position.toString());
  }

  Future<Position?> _getCurrentPosition() async {
    final hasPermission = await _handlePermission();
    if (!hasPermission) {
      return null;
    }
    return _geolocatorPlatform.getCurrentPosition();
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
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
