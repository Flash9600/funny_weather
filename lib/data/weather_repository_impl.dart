import 'package:dio/dio.dart';

import 'models/weather_response_model.dart';

const _apiKey = '0bd0ce830a6f4ebba62125350243101';

const String domain = 'http://api.weatherapi.com';

final _options = BaseOptions(
  baseUrl: domain,
  connectTimeout: const Duration(seconds: 10),
  receiveTimeout: const Duration(seconds: 30),
  headers: {'key': _apiKey},
  queryParameters: {'lang': 'ru'},
);

class WeatherServiceImpl {
  final Dio _dioClient = Dio(_options);

  Future<WeatherResponseModel?> fetchCurrentWeather(String location) async {
    try {
      final response = await _dioClient.get('/v1/current.json', queryParameters: {
        'q': location,
      });

      if (response.statusCode == 200) {
        return WeatherResponseModel.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      throw Exception('fetchCurrentWeather error: $e');
    }
  }
}
