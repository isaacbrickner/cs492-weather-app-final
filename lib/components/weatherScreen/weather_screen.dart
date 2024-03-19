import 'package:cs492_weather_app/models/weather_forecast.dart';
import 'hourly_forecast_list.dart';
import '../../models/user_location.dart';
import 'package:flutter/material.dart';
import '../location/location.dart';
import 'forecast_hourly_widget.dart';

class WeatherScreen extends StatefulWidget {
  final Function getLocation;
  final Function getForecasts;
  final Function getForecastsHourly;
  final Function setLocation;

  const WeatherScreen(
      {super.key,
      required this.getLocation,
      required this.getForecasts,
      required this.getForecastsHourly,
      required this.setLocation});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return (widget.getLocation() != null && widget.getForecasts().isNotEmpty
        ? ForecastWidget(
            context: context,
            location: widget.getLocation(),
            hourlyForecast: widget.getForecastsHourly(),
            forecasts: widget.getForecasts())
            
        : LocationWidget(widget: widget));
  }
}

class ForecastWidget extends StatelessWidget {
  final UserLocation location;
  final List<WeatherForecast> forecasts;
  final BuildContext context;
  final List<WeatherForecast> hourlyForecast;

  const ForecastWidget(
      {super.key,
      required this.context,
      required this.hourlyForecast,
      required this.location,
      required this.forecasts});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LocationTextWidget(location: location),
        TemperatureWidget(forecasts: forecasts),
        DescriptionWidget(forecasts: forecasts),
        HourlyForecast(location: location, hourlyForecast: hourlyForecast),
        HourlyForecastList(forecasts: hourlyForecast),       
      ],
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
    required this.forecasts,
  });

  final List<WeatherForecast> forecasts;

  @override
  Widget build(BuildContext context) {
    String emoji = '';

    // Determine which emoji to use based on the short forecast
    if (forecasts.elementAt(0).shortForecast == 'Sunny') {
      emoji = '☀';
    } else if (forecasts.elementAt(0).shortForecast == 'Rainy') {
      emoji = '🌧️';
    } else if (forecasts.elementAt(0).shortForecast == 'Cloudy') {
      emoji = '☁️';
    } else if (forecasts.elementAt(0).shortForecast == 'Chance Rain Showers') {
      emoji = '🌧️';
    } else if (forecasts.elementAt(0).shortForecast == 'Mostly Sunny') {
      emoji = '☀' '☁️';
    } else if (forecasts.elementAt(0).shortForecast == 'Mostly Cloudy') {
      emoji = '☁️';}
      else if (forecasts.elementAt(0).shortForecast == 'Clear') {
      emoji = '🌙';}
    return SizedBox(
      height: 25,
      width: 500,
      child: Center(
          child: Text(forecasts.elementAt(0).shortForecast + emoji,
              style: Theme.of(context).textTheme.bodyMedium)),
    );
  }
}

class TemperatureWidget extends StatelessWidget {
  const TemperatureWidget({
    super.key,
    required this.forecasts,
  });

  final List<WeatherForecast> forecasts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 60,
      child: Center(
        child: Text('${forecasts.elementAt(0).temperature}º',
            style: Theme.of(context).textTheme.displayLarge),
      ),
    );
  }
}

class LocationTextWidget extends StatelessWidget {
  const LocationTextWidget({
    super.key,
    required this.location,
  });

  final UserLocation location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: 500,
        child: Center(child: Text("${location.city}, ${location.state}, ${location.zip}",
            style: Theme.of(context).textTheme.headlineSmall), ),
      ),
    );
  }
}

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
    required this.widget,
  });

  final WeatherScreen widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Requires a location to begin"),
          ),
          Location(
              setLocation: widget.setLocation,
              getLocation: widget.getLocation),
        ],
      ),
    );
  }
}
