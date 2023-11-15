import 'package:flutter/material.dart';
import 'package:weatherapp/models/forecast.dart';
import 'package:weatherapp/widgets/city_list.dart';
import 'package:weatherapp/widgets/future_weather_list.dart';
import 'package:weatherapp/widgets/text_icon.dart';
import 'package:weatherapp/widgets/weather_info_card.dart';

class ForcastPage extends StatefulWidget {
  final String currentLocation;
  final String todaysDate;
  final String currentTemperature;
  final String weatherType;
  final double windSpeed;
  final double precip;
  final String weatherIcon;
  final List<Forecast> forecast;

  const ForcastPage(
      {super.key,
      required this.forecast,
      required this.weatherIcon,
      required this.precip,
      required this.windSpeed,
      required this.currentLocation,
      required this.currentTemperature,
      required this.todaysDate,
      required this.weatherType});

  @override
  State<StatefulWidget> createState() => _ForcastPage();
}

class _ForcastPage extends State<ForcastPage> {
  Row getExtraWeatherInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const TextIcon(
            icon: Icons.cloud, text: 'Cloudy', colorValue: 0XFFE1B626),
        TextIcon(
            icon: Icons.air,
            text: widget.windSpeed.toString(),
            colorValue: 0XFFE1B626),
        TextIcon(
            icon: Icons.water_drop,
            text: widget.precip.toString(),
            colorValue: 0XFFE1B626)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121343),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0xFF121343),
        centerTitle: true,
        title: Text('Weather Forcast',
            style: TextStyle(color: Color(Colors.white.value))),
      ),
      body:
          ListView(shrinkWrap: true, scrollDirection: Axis.vertical, children: [
        WeatherCard(
          currentLocation: widget.currentLocation,
          date: widget.todaysDate,
          temperature: widget.currentTemperature,
          weatherType: widget.weatherType,
          weatherIcon: 'https:${widget.weatherIcon}',
        ),
        const SizedBox(height: 20.0),
        getExtraWeatherInfo(),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.0, top: 20.0),
              child: ForecastList(items: widget.forecast),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: CityWeatherList(cityWeatherList: [
                {"name": "nikhil"},
                {"name": "nikhil"},
                {"name": "nikhil"},
                {"name": "nikhil"},
                {"name": "nikhil"},
                {"name": "nikhil"}
              ]),
            ),
          ],
        ),
      ]),
    );
  }
}
