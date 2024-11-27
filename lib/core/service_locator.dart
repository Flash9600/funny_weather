import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/bloc/home_screen_widget/home_screen_widget_cubit.dart';
import 'package:weather_app/bloc/repositories/weather_repository.dart';
import 'package:weather_app/bloc/weather_main/weather_main_cubit.dart';
import 'package:weather_app/core/network_provider.dart';
import 'package:weather_app/core/permission_provider.dart';
import 'package:weather_app/data/weather_repository_impl.dart';

final class ServiceLocator {
  ServiceLocator._internal() {
    init();
  }
  factory ServiceLocator() => _singleton;

  static final _singleton = ServiceLocator._internal();

  final GetIt _getIt = GetIt.instance;

  T get<T extends Object>({
    dynamic param1,
    dynamic param2,
    String? instanceName,
    Type? type,
  }) =>
      _getIt.get<T>(
        param1: param1,
        param2: param2,
        instanceName: instanceName,
        type: type,
      );

  void init() {
    _registerSingleton();
    _registerFactory();
  }

  void _registerSingleton() {
    _getIt.registerSingleton<WeatherNetworkProvider>(WeatherNetworkProvider());
    _getIt.registerSingleton<WeatherRepository>(WeatherRepositoryImpl(_getIt.get()));
    _getIt.registerSingleton<GeolocatorPlatform>(GeolocatorPlatform.instance);
    _getIt.registerSingleton<PermissionProvider>(PermissionProvider(_getIt.get()));
  }

  void _registerFactory() {
    _getIt.registerFactory<MicroBettingTimerCubit>(
      () => MicroBettingTimerCubit(
        weatherRepository: _getIt.get(),
        geolocatorProvider: _getIt.get(),
        permissionProvider: _getIt.get(),
      ),
    );
     _getIt.registerFactory<HomeScreenWidgetCubit>(() => HomeScreenWidgetCubit());
  }
}
