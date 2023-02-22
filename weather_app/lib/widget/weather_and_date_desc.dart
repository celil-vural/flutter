import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/weather/weather_bloc.dart';

class WeatherAndDateDesc extends StatelessWidget {
  const WeatherAndDateDesc({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        final responseWeather = (state as WeatherLoaded).weather.result![0];
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  responseWeather.day.toString(),
                  style: const TextStyle(fontSize: 25),
                ),
                Text(
                  responseWeather.date.toString(),
                  style: const TextStyle(fontSize: 25),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Status:',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  responseWeather.status.toString(),
                  style: const TextStyle(fontSize: 25),
                ),
              ],
            ),
            Center(
              child: Text(
                '${responseWeather.degree} C',
                style: const TextStyle(fontSize: 25),
              ),
            ),
          ],
        );
      },
    );
  }
}
