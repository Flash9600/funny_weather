import 'package:json_annotation/json_annotation.dart';

part 'weather_location_model.g.dart';

@JsonSerializable()
class WeatherLocationModel {
  factory WeatherLocationModel.fromJson(Map<String, dynamic> json) => _$WeatherLocationModelFromJson(json);

  WeatherLocationModel({
    required this.name,
    required this.region,
    required this.country,
    required this.localtime,
  });

  final String name;
  final String region;
  final String country;
  final DateTime localtime;

  Map<String, dynamic> toJson() => _$WeatherLocationModelToJson(this);
}
