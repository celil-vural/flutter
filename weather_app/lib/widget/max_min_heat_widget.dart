import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/weather/weather_bloc.dart';

class MaxMinHeatWidget extends StatelessWidget {

  const MaxMinHeatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: weatherBloc,
      builder: (context, state) {
        final String max, min;
        final weather=(state as WeatherLoaded).weather;
        max=weather.result![0].max.toString();
        min=weather.result![0].min.toString();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Max: $max C',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Min:$min C',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        );
      },
    );
  }
}
