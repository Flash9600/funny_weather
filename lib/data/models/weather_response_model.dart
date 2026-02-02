import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/data/models/weather_current_model.dart';
import 'package:weather_app/data/models/weather_location_model.dart';
import 'package:weather_app/models/main_weather_model.dart';

part 'weather_response_model.g.dart';

@JsonSerializable()
class WeatherResponseModel {
  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) => _$WeatherResponseModelFromJson(json);

  WeatherResponseModel({
    required this.location,
    required this.current,
  });

  final WeatherLocationModel location;
  final WeatherCurrentModel current;

  MainWeatherModel get toWeatherModel =>
      MainWeatherModel(currentTemperature: '${current.temp_c}°', location: location.name);

  Map<String, dynamic> toJson() => _$WeatherResponseModelToJson(this);
}
