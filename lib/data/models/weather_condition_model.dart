import 'package:json_annotation/json_annotation.dart';

part 'weather_condition_model.g.dart';

@JsonSerializable()
class WeatherConditionModel {
  WeatherConditionModel({
    required this.text,
    required this.icon,
    required this.code,
  });


  final String text;
  final String icon;
  final int code;

  factory WeatherConditionModel.fromJson(Map<String, dynamic> json) => _$WeatherConditionModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherConditionModelToJson(this);
}