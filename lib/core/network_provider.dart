import 'package:dio/dio.dart';
import 'package:weather_app/core/exceptions/networt_exceptions.dart';

const _apiKey = '0bd0ce830a6f4ebba62125350243101';
const String _domain = 'http://api.weatherapi.com';
final _options = BaseOptions(
  baseUrl: _domain,
  connectTimeout: const Duration(seconds: 10),
  receiveTimeout: const Duration(seconds: 30),
  headers: {'key': _apiKey},
  queryParameters: {'lang': 'ru'},
);

final class WeatherNetworkProvider {
  final Dio _dioClient = Dio(_options);
  Future<Response<T>> get<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) {
    try {
      return _dioClient.get(path, data: data, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw NetworkException(statusCode: e.response!.statusCode!, message: e.response?.statusMessage);
    }
  }
}