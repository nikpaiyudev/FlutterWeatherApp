import 'package:weatherapp/models/city.dart';
import 'package:weatherapp/provider/Weather_provider.dart';

class WeatherRepository {
  final _weatherProvider = WeatherProvider();

  Future<CityWeather> getWeatherBasedOnLatAndLong(String lat, String long) =>
      _weatherProvider.getWeatherInfoBasedOnLatAndLong(lat, long);
}
