import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_widget/home_widget.dart';
import 'package:weather_app/models/main_weather_model.dart';
import 'package:weather_app/presentation/main_page.dart';

part 'home_screen_widget_state.dart';

/// Factory cubit, use on the [MainPage].

class HomeScreenWidgetCubit extends Cubit<HomeScreenWidgetState> {
  HomeScreenWidgetCubit() : super(const HomeScreenWidgetState()) {
    HomeWidget.setAppGroupId(_appGroupId);
  }

  static const _appGroupId = 'group.FunnyWeatherWidget';
  static const _widgetName = 'FunnyWeatherWidget';

  FutureOr<void> sendDataToWidget(MainWeatherModel weatherModel) async {
    bool needUpdate = false;
    if (weatherModel.location != null) {
      needUpdate = await HomeWidget.saveWidgetData<String>('location', weatherModel.location) ?? false;
    }

    if (weatherModel.currentTemperature != null) {
      final isSaved = await HomeWidget.saveWidgetData<String>('temperature', weatherModel.currentTemperature) ?? false;
      needUpdate = needUpdate || isSaved;
    }

    if (needUpdate) {
      await _updateWidget();
    }
  }

  Future<void> _updateWidget() async {
    await HomeWidget.updateWidget(
      iOSName: _widgetName,
      androidName: _widgetName,
    );
  }
}
