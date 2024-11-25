import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_main/weather_main_cubit.dart';
import 'package:weather_app/presentation/main_page.dart';
import 'package:weather_app/services/service_locator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MicroBettingTimerCubit>(
      create: (BuildContext context) => ServiceLocator().get<MicroBettingTimerCubit>(),
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
