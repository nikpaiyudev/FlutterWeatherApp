import 'package:weatherapp/models/forecast.dart';

class CityWeather {
  final String name;
  final String country;
  final double lat;
  final double long;
  final String localTime;
  final double temperature;
  final String weatherType;
  final double windSpeed;
  final double precip;
  final String icon;
  final List<Forecast> forecastList;

  CityWeather(
      {required this.temperature,
      required this.lat,
      required this.long,
      required this.name,
      required this.windSpeed,
      required this.forecastList,
      required this.localTime,
      required this.country,
      required this.icon,
      required this.precip,
      required this.weatherType});

  factory CityWeather.fromJson(Map<String, dynamic> json) {
    return CityWeather(
        lat: json['location']['lat'],
        long: json['location']['lon'],
        forecastList: (json['forecast']['forecastday'] as List)
            .map((data) => Forecast.fromJson(data))
            .toList(),
        precip: json['current']['precip_mm'],
        name: json['location']['name'],
        icon: json['current']['condition']['icon'],
        country: json['location']['country'],
        windSpeed: json['current']['wind_kph'],
        localTime: json['location']['localtime'],
        temperature: json['current']['temp_c'],
        weatherType: json['current']['condition']['text']);
  }
}
