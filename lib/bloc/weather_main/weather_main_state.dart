part of 'weather_main_cubit.dart';

@immutable
class WeatherMainState {
  const WeatherMainState({
    this.loading = false,
    this.weatherModel,
  });

  final bool loading;
  final MainWeatherModel? weatherModel;

  WeatherMainState copyWith({
    bool? loading,
    MainWeatherModel? weatherModel,
  }) =>
      WeatherMainState(
        loading: loading ?? this.loading,
        weatherModel: weatherModel ?? this.weatherModel,
      );
}
