part of 'home_screen_widget_cubit.dart';

@immutable
class HomeScreenWidgetState {
  const HomeScreenWidgetState({
    this.location,
    this.currentTemperature,
  });

  final String? location;
  final double? currentTemperature;

  HomeScreenWidgetState copyWith({
    String? location,
    double? currentTemperature,
  }) =>
      HomeScreenWidgetState(
        location: location ?? this.location,
        currentTemperature: currentTemperature ?? this.currentTemperature,
      );
}
