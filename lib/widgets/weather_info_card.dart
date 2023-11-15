import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String date;
  final String temperature;
  final String currentLocation;
  final String weatherType;
  final String weatherIcon;

  const WeatherCard(
      {super.key,
      required this.date,
      required this.weatherIcon,
      required this.currentLocation,
      required this.temperature,
      required this.weatherType});

  TextStyle getTextStyle(double? size, Color color) =>
      TextStyle(color: color, fontSize: size);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      decoration: const BoxDecoration(
        color: Color(0xFF202150),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Today',
                  style: getTextStyle(20.0, Color(Colors.white.value))),
              Text(date, style: getTextStyle(20.0, Color(Colors.white.value)))
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(weatherType,
                      style: getTextStyle(20.0, Color(Colors.white.value))),
                  Text(temperature,
                      style: getTextStyle(40.0, Color(Colors.white.value)))
                ],
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    color: Color(Colors.white.value),
                    borderRadius: BorderRadius.circular(100.0)),
                child: Image.network(
                  weatherIcon,
                  scale: 1,
                ),
              )
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_pin,
                  color: Color(0XFFE1B626), size: 20.0),
              const SizedBox(width: 10.0),
              Text(currentLocation,
                  style: getTextStyle(16.0, Color(Colors.white.value)))
            ],
          )
        ],
      ),
    );
  }
}
