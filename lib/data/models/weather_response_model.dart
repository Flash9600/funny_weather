import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/data/models/weather_current_model.dart';
import 'package:weather_app/data/models/weather_location_model.dart';

part 'weather_response_model.g.dart';

@JsonSerializable()
class WeatherResponseModel {
  WeatherResponseModel({
    required this.location,
    required this.current,
  });

final WeatherLocationModel location;
final WeatherCurrentModel current;

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) => _$WeatherResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseModelToJson(this);
}