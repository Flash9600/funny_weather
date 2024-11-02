import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/data/models/weather_condition_model.dart';

part 'weather_current_model.g.dart';

@JsonSerializable()
class WeatherCurrentModel {
  WeatherCurrentModel({
    required this.temp_c,
    required this.condition,
    required this.wind_mph,
    required this.humidity,
    required this.cloud,
    required this.feelslike_c,
    required this.gust_mph,
  });

  final double temp_c;
  final WeatherConditionModel condition;
  final double wind_mph;
  final int humidity;
  final int cloud;
  final double feelslike_c;
  final double gust_mph;

  factory WeatherCurrentModel.fromJson(Map<String, dynamic> json) => _$WeatherCurrentModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherCurrentModelToJson(this);
}