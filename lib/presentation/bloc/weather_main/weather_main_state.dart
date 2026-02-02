part of 'weather_main_cubit.dart';

@immutable
class WeatherMainState {
  const WeatherMainState({
    this.loading = false,
    this.weatherModel,
    this.errorMessage,
  });

  final bool loading;
  final MainWeatherModel? weatherModel;
  final String? errorMessage;

  WeatherMainState copyWith({
    bool? loading,
    MainWeatherModel? weatherModel,
    String? errorMessage,
  }) =>
      WeatherMainState(
        loading: loading ?? this.loading,
        weatherModel: weatherModel ?? this.weatherModel,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
