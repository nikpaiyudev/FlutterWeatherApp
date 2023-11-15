import 'package:flutter/material.dart';
import 'package:weatherapp/widgets/weather_card.dart';

class CityWeatherList extends StatelessWidget {
  final List<dynamic> cityWeatherList;

  const CityWeatherList({super.key, required this.cityWeatherList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Top Cities',
                style: TextStyle(
                    color: Color(Colors.white.value), fontSize: 24.0)),
            const Text('All Cities',
                style: TextStyle(color: Color(0XFFE1B626), fontSize: 16.0))
          ],
        ),
        SizedBox(height: 20.0),
        ListView.builder(
            shrinkWrap: true,
            itemCount: cityWeatherList.length,
            itemBuilder: (builder, index) {
              return const SmallWeatherCard(
                  cityName: 'New Delhi', temperature: 20, time: '2 AM');
            }),
      ],
    );
  }
}
