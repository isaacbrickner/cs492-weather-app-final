import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:cs492_weather_app/models/weather_forecast.dart';

class HourlyForecastList extends StatelessWidget {
  const HourlyForecastList({super.key, required this.forecasts});
  final List<WeatherForecast> forecasts;
  

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 550,
      width: double.infinity,
      child: Card(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 25,
            itemBuilder: (BuildContext context, int index) {
              DateTime forecastTime =
                  DateTime.parse(forecasts[index].startTime).toLocal();
              bool showNowText = index == 0;
              return SizedBox(
                width: 100,
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(showNowText
                        ? DateFormat('h:mm a \n EEE d MMM').format(DateTime.now())
                        : DateFormat('h:mm a \n EEE d MMM').format(forecastTime)),
                    Text("${forecasts[index].temperature}º"),
                  ],
                ),
              );
            }),
      ),
    );
  }
}