import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather/weather_bloc.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        final city=(state as WeatherLoaded).weather.city;
        return Text(
          city.toString().toUpperCase(),
          style: const TextStyle(fontSize: 30),
        );
      },
    );
  }
}
