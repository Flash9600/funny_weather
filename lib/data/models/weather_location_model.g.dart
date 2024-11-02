// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherLocationModel _$WeatherLocationModelFromJson(
        Map<String, dynamic> json) =>
    WeatherLocationModel(
      name: json['name'] as String,
      region: json['region'] as String,
      country: json['country'] as String,
      localtime: DateTime.parse(json['localtime'] as String),
    );

Map<String, dynamic> _$WeatherLocationModelToJson(
        WeatherLocationModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'localtime': instance.localtime.toIso8601String(),
    };
