// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_current_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherCurrentModel _$WeatherCurrentModelFromJson(Map<String, dynamic> json) =>
    WeatherCurrentModel(
      temp_c: (json['temp_c'] as num).toDouble(),
      condition: WeatherConditionModel.fromJson(
          json['condition'] as Map<String, dynamic>),
      wind_mph: (json['wind_mph'] as num).toDouble(),
      humidity: json['humidity'] as int,
      cloud: json['cloud'] as int,
      feelslike_c: (json['feelslike_c'] as num).toDouble(),
      gust_mph: (json['gust_mph'] as num).toDouble(),
    );

Map<String, dynamic> _$WeatherCurrentModelToJson(
        WeatherCurrentModel instance) =>
    <String, dynamic>{
      'temp_c': instance.temp_c,
      'condition': instance.condition,
      'wind_mph': instance.wind_mph,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'feelslike_c': instance.feelslike_c,
      'gust_mph': instance.gust_mph,
    };
