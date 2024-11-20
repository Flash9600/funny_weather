part of 'weather_main_cubit.dart';

@immutable
class WeatherMainState {
  const WeatherMainState({
    this.loading = false,
    this.location,
    this.currentTemperature,
  });

  final String? location;
  final bool loading;
  final double? currentTemperature;

  WeatherMainState copyWith({
    bool? loading,
    String? location,
    double? currentTemperature,
  }) =>
      WeatherMainState(
        loading: loading ?? this.loading,
        location: location ?? this.location,
        currentTemperature: currentTemperature ?? this.currentTemperature,
      );
}
