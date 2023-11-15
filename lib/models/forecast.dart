class Forecast {
  final String day;
  final String maxTemperature;
  final String weatherIcon;

  Forecast(
      {required this.day,
      required this.maxTemperature,
      required this.weatherIcon});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
        day: json['date'],
        maxTemperature: json['day']['maxtemp_c'].toString(),
        weatherIcon: json['day']['condition']['icon']);
  }
}
