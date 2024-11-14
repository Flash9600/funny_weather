import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/weather_main/weather_main_cubit.dart';
import 'data/weather_repository_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MicroBettingTimerCubit>(
      create: (BuildContext context) => MicroBettingTimerCubit(),
      child: MaterialApp(
        title: 'Funny weather',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final service = WeatherServiceImpl();

  final temperatureValue = ValueNotifier<double>(1);

  @override
  void initState() {
    super.initState();

    getTemperature();
  }

  void getTemperature() async {
    final result = await service.fetchCurrentWeather('izhevsk');
    temperatureValue.value = result?.current.feelslike_c ?? 99;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Weather'),
      ),
      body: BlocBuilder<MicroBettingTimerCubit, WeatherMainState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Weather now',
                ),
                ValueListenableBuilder<double>(
                  valueListenable: temperatureValue,
                  builder: (_, value, __) => Text(
                    '$value',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
