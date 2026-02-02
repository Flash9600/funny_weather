import 'package:weather_app/core/network_provider.dart';
import 'package:weather_app/data/models/weather_response_model.dart';

final class WeatherApiService {
  WeatherApiService(this.networkProvider);

  final WeatherNetworkProvider networkProvider;

  Future<WeatherResponseModel?> fetchCurrentWeather(String location) async {
    final response = await networkProvider.get(
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
  }
}
