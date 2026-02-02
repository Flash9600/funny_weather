import 'package:weather_app/presentation/bloc/repositories/weather_repository.dart';
import 'package:weather_app/data/models/weather_response_model.dart';
import 'package:weather_app/data/weather_api_service.dart';

final class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl(this.weatherApiService);

  final WeatherApiService weatherApiService;

  @override
  Future<({WeatherResponseModel? result, String? error})> fetchCurrentWeather(String location) async {
    try {
      final result = await weatherApiService.fetchCurrentWeather(location);
      return (result: result, error: null);
    } catch (e) {
      return (result: null, error: e.toString());
    }
  }
}
