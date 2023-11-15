import 'package:flutter/material.dart';

class SmallWeatherCard extends StatelessWidget {
  final String cityName;
  final int temperature;
  final String time;

  const SmallWeatherCard(
      {super.key,
      required this.cityName,
      required this.temperature,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      margin: const EdgeInsets.only(bottom: 5.0),
      decoration: BoxDecoration(
          color: Color(Colors.white.value),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cityName, style: const TextStyle(fontSize: 20.0)),
              Text(time)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.snowing, size: 24, color: Color(0XFFE1B626)),
              const SizedBox(width: 10.0),
              Text(
                temperature.toString(),
                style: const TextStyle(fontSize: 20.0),
              )
            ],
          )
        ],
      ),
    );
  }
}
