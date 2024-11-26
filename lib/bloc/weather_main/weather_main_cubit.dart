import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/bloc/repositories/weather_repository.dart';
import 'package:weather_app/services/permission_service.dart';
import 'package:weather_app/utils/extensions/geolocation_extension.dart';

part 'weather_main_state.dart';

class MicroBettingTimerCubit extends Cubit<WeatherMainState> {
  MicroBettingTimerCubit({
    required WeatherRepository weatherRepository,
    required GeolocatorPlatform geolocatorService,
    required PermissionService permissionService,
  })  : _weatherRepository = weatherRepository,
        _geolocatorService = geolocatorService,
        _permissionService = permissionService,
        super(const WeatherMainState()) {
    init();
  }

  final WeatherRepository _weatherRepository;

  final GeolocatorPlatform _geolocatorService;

  final PermissionService _permissionService;

  FutureOr<void> init() async {
    emit(state.copyWith(loading: true));
    final (position, error) = await _getCurrentPosition();

    if (error != null) {

    // TODO(I): handle errors
    }

    if (position != null) {
      // TODO(I): handle errors
      final weatherResult = await _weatherRepository.fetchCurrentWeather(position.weatherApiFormat);
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

  Future<(Position? position, String? error)> _getCurrentPosition() async {
    final hasPermission = await _permissionService.handleGeolocaitonPermission();

    if (!hasPermission) {
      return (null, 'Permission not obtained');
    }

    try {
      return (await _geolocatorService.getCurrentPosition(), null);
    } catch (e) {
      return (null, e.toString());
    }
  }
}
