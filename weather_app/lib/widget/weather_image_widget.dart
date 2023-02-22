import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather/weather_bloc.dart';

class WeatherImageWidget extends StatelessWidget {
  const WeatherImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        final responseWeather = (state as WeatherLoaded).weather.result![0];
        return Image.network(responseWeather.icon.toString(),
            fit: BoxFit.cover);
      },
    );
  }
}
