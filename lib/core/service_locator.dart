import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/presentation/bloc/home_screen_widget/home_screen_widget_cubit.dart';
import 'package:weather_app/presentation/bloc/repositories/weather_repository.dart';
import 'package:weather_app/presentation/bloc/weather_main/weather_main_cubit.dart';
import 'package:weather_app/core/network_provider.dart';
import 'package:weather_app/core/permission_provider.dart';
import 'package:weather_app/data/weather_api_service.dart';
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
    _getIt.registerLazySingleton<WeatherNetworkProvider>(() => WeatherNetworkProvider());
    _getIt.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(_getIt.get()));
    _getIt.registerLazySingleton<GeolocatorPlatform>(() => GeolocatorPlatform.instance);
    _getIt.registerLazySingleton<PermissionProvider>(() => PermissionProvider(_getIt.get()));
    _getIt.registerLazySingleton<WeatherApiService>(() => WeatherApiService(_getIt.get()));
  }

  void _registerFactory() {
    _getIt.registerFactory<WeatherMainCubit>(
      () => WeatherMainCubit(
        weatherRepository: _getIt.get(),
        geolocatorProvider: _getIt.get(),
        permissionProvider: _getIt.get(),
      ),
    );
    _getIt.registerFactory<HomeScreenWidgetCubit>(() => HomeScreenWidgetCubit());
  }
}
