import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_main/weather_main_cubit.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
