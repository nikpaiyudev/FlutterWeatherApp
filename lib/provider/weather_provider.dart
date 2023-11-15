import 'dart:convert';
import 'package:weatherapp/api/http.dart';
import 'package:weatherapp/constants/api/api_constants.dart';
import 'package:weatherapp/models/city.dart';

class WeatherProvider {
  final _http = Http();

  Future<CityWeather> getWeatherInfoBasedOnLatAndLong(
      String lat, String long) async {
    try {
      final url = '$apiUrl?key=$apiKey&q=$lat,$long&aqi=no&days=15';
      final res = await _http.get(url);
      return CityWeather.fromJson(json.decode(res.body));
    } catch (e) {
      throw Exception(e);
    }
  }
}
