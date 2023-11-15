import 'package:flutter/material.dart';
import 'package:weatherapp/models/forecast.dart';
import 'package:weatherapp/util/get_day_of_Week.dart';

class ForecastList extends StatelessWidget {
  final List<Forecast> items;

  const ForecastList({super.key, required this.items});

  Container futureWeatherListItem(String date, String icon, String maxTemp) {
    return Container(
      margin: const EdgeInsets.only(right: 20.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0), color: Color(0xFF202150)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            date,
            style: TextStyle(color: Color(Colors.white.value), fontSize: 14.0),
          ),
          Icon(Icons.snowing, color: Color(Colors.white.value)),
          Text(maxTemp,
              style:
                  TextStyle(color: Color(Colors.white.value), fontSize: 18.0))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(items);
    // TODO: implement build
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Today',
                style: TextStyle(
                    color: Color(Colors.white.value), fontSize: 24.0)),
            const Text('Next 15 days',
                style: TextStyle(color: Color(0XFFE1B626), fontSize: 16.0))
          ],
        ),
        const SizedBox(height: 15.0),
        SizedBox(
          height: 140.0,
          child: ListView.builder(
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (builder, index) {
                if (items.isNotEmpty) {
                  return futureWeatherListItem(
                      getDayOfWeek(DateTime.parse(items[index].day)),
                      items[index].weatherIcon,
                      items[index].maxTemperature);
                }
                return const CircularProgressIndicator();
              }),
        ),
      ],
    );
  }
}
