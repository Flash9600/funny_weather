import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/bloc/repositories/weather_repository.dart';
import 'package:weather_app/core/permission_provider.dart';
import 'package:weather_app/models/main_weather_model.dart';
import 'package:weather_app/presentation/main_page.dart';
import 'package:weather_app/utils/extensions/geolocation_extension.dart';

part 'weather_main_state.dart';

/// Factory cubit, use on the [MainPage].
class WeatherMainCubit extends Cubit<WeatherMainState> {
  WeatherMainCubit({
    required WeatherRepository weatherRepository,
    required GeolocatorPlatform geolocatorProvider,
    required PermissionProvider permissionProvider,
  })  : _weatherRepository = weatherRepository,
        _geolocatorProvider = geolocatorProvider,
        _permissionProvider = permissionProvider,
        super(const WeatherMainState()) {
    init();
  }

  final WeatherRepository _weatherRepository;

  final GeolocatorPlatform _geolocatorProvider;

  final PermissionProvider _permissionProvider;

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
            weatherModel: weatherResult.toWeatherModel,
          ),
        );
      }

      return;
    }
  }

  Future<(Position? position, String? error)> _getCurrentPosition() async {
    final hasPermission = await _permissionProvider.handleGeolocaitonPermission();

    if (!hasPermission) {
      return (null, 'Permission not obtained');
    }

    try {
      return (await _geolocatorProvider.getCurrentPosition(), null);
    } catch (e) {
      return (null, e.toString());
    }
  }
}
