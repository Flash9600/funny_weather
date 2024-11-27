import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/home_screen_widget/home_screen_widget_cubit.dart';
import 'package:weather_app/bloc/weather_main/weather_main_cubit.dart';
import 'package:weather_app/core/service_locator.dart';
import 'package:weather_app/presentation/main_page.dart';

class EntryWidget extends StatelessWidget {
  const EntryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MicroBettingTimerCubit>(create: (_) => ServiceLocator().get<MicroBettingTimerCubit>(),),
        BlocProvider<HomeScreenWidgetCubit>(create: (_) => ServiceLocator().get<HomeScreenWidgetCubit>(),),
      ],
      child: MaterialApp(
        title: 'Funny weather',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainPage(),
      ),
    );
  }
}
