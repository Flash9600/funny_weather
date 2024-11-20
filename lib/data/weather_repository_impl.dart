import 'package:weather_app/bloc/repositories/weather_repository.dart';
import 'package:weather_app/data/models/weather_response_model.dart';
import 'package:weather_app/services/network_service.dart';

final class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl(this.networkService);

  final WeatherNetworkService networkService;

  @override
  Future<WeatherResponseModel?> fetchCurrentWeather(String location) async {
    try {
      final response = await networkService.get(
        '/v1/current.json',
        queryParameters: {
          'q': location,
        },
      );

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
