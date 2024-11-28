import 'package:flutter/foundation.dart';

@immutable
class MainWeatherModel {
  const MainWeatherModel({
    required this.location,
    required this.currentTemperature,
  });

  final String? location;
  final String? currentTemperature;
}
