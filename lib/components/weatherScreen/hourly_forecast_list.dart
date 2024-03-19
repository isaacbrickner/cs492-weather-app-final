import 'package:cs492_weather_app/components/weatherScreen/weather_screen.dart';
import 'package:cs492_weather_app/models/user_location.dart';
import 'package:cs492_weather_app/models/weather_forecast.dart';
import 'package:flutter/material.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast(
      {super.key, required this.location, required this.hourlyForecast});
  final UserLocation location;
  final List<WeatherForecast> hourlyForecast;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          LocationTextWidget(location: location),
          TemperatureWidget(forecasts: hourlyForecast),
          DescriptionWidget(forecasts: hourlyForecast),
        ],
      ),
    );
  }
}