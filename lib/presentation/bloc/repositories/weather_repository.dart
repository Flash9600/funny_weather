import 'package:weather_app/data/models/weather_response_model.dart';

abstract interface class WeatherRepository {
  Future<({WeatherResponseModel? result, String? error})> fetchCurrentWeather(String location);
}
