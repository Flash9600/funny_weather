import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_widget/home_widget.dart';

part 'home_screen_widget_state.dart';

/// Factory cubit, use on the [MainPage].

class HomeScreenWidgetCubit extends Cubit<HomeScreenWidgetState> {
  HomeScreenWidgetCubit() : super(const HomeScreenWidgetState()) {
    HomeWidget.setAppGroupId(_appGroupId);
  }

  static const _appGroupId = 'FunnyWeatherWidgetGroupId';
  static const _widgetName = 'FunnyWeatherWidgetName';

  FutureOr<void> sendDataToWidget({
    String? location,
    double? currentTemperature,
  }) {
    bool needUpdate = false;
    if (location != null) {
      HomeWidget.saveWidgetData<String>('location', location);
      needUpdate = true;
    }

    if (currentTemperature != null) {
      HomeWidget.saveWidgetData<String>('temperature', currentTemperature.toString());
      needUpdate = true;
    }

    if (needUpdate) {
      HomeWidget.updateWidget(
        iOSName: _widgetName,
        androidName: _widgetName,
      );
    }
  }
}
