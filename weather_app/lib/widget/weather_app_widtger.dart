import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather/weather_bloc.dart';
import 'package:weather_app/widget/last_update_widget.dart';
import 'package:weather_app/widget/localtion_widget.dart';
import 'package:weather_app/widget/max_min_heat_widget.dart';
import 'package:weather_app/widget/select_city.dart';
import 'package:weather_app/widget/weather_and_date_desc.dart';
import 'package:weather_app/widget/weather_image_widget.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  String selectedCity = 'Ankara';

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () async {
              selectedCity = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return const SelectCity();
              }));
              if (selectedCity != null) {
                weatherBloc.add(
                    FetchWeatherEvent(cityName: selectedCity.toLowerCase()));
              }
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) {
            return const Center(
              child: Text('Please Select a City'),
            );
          }
          if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WeatherLoaded) {
            return Center(
                child: ListView(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: LocationWidget(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: LastUpdateWidget(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 200,
                    child: Center(
                      child: WeatherImageWidget(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: WeatherAndDateDesc(),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: MaxMinHeatWidget(),
                  ),
                ),
              ],
            ));
          }
          if (state is WeatherError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
    );
  }
}
