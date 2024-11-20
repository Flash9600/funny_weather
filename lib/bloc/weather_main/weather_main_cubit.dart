import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/bloc/repositories/weather_repository.dart';
import 'package:weather_app/utils/extensions/geolocation_extension.dart';

part 'weather_main_state.dart';

class MicroBettingTimerCubit extends Cubit<WeatherMainState> {
  MicroBettingTimerCubit(this.weatherRepository) : super(const WeatherMainState()) {
    init();
  }

  final WeatherRepository weatherRepository;

  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  FutureOr<void> init() async {
    emit(state.copyWith(loading: true));
    // TODO(I): handle errors
    final position = await _getCurrentPosition();
    if (position != null) {
      // TODO(I): handle errors
      final weatherResult = await weatherRepository.fetchCurrentWeather(position.weatherApiFormat);
      if (weatherResult != null) {
        emit(
          WeatherMainState(
            location: weatherResult.location.name,
            currentTemperature: weatherResult.current.temp_c,
          ),
        );
      }

      return;
    }
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
