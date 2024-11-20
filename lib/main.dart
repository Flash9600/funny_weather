import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/services/service_locator.dart';

import 'bloc/weather_main/weather_main_cubit.dart';

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
  final temperatureValue = ValueNotifier<double>(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Weather'),
      ),
      body: BlocBuilder<MicroBettingTimerCubit, WeatherMainState>(
        builder: (context, state) {
          return Center(
            child: state.loading
                ? const CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Weather in ${state.location}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        '${state.currentTemperature}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
