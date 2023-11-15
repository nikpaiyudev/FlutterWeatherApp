import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/models/city.dart';

import 'package:weatherapp/pages/forcast_page.dart';
import 'package:weatherapp/repository/weather_repository.dart';
import 'package:weatherapp/util/determine_location.dart';
import 'package:weatherapp/widgets/gradient_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    void getCurrentLocationAndWeather() async {
      final navigator = Navigator.of(context);
      WeatherRepository weatherRepository = WeatherRepository();
      Position position = await getUserLocation();
      CityWeather cityWeather =
          await weatherRepository.getWeatherBasedOnLatAndLong(
              position.latitude.toString(), position.longitude.toString());

      navigator.push(MaterialPageRoute(
          builder: (context) => ForcastPage(
              forecast: cityWeather.forecastList,
              weatherIcon: cityWeather.icon,
              precip: cityWeather.precip,
              windSpeed: cityWeather.windSpeed,
              currentLocation: cityWeather.name,
              currentTemperature: cityWeather.temperature.toString(),
              todaysDate: DateFormat.yMMMMd().format(DateTime.now()),
              weatherType: cityWeather.weatherType)));
    }

    return Scaffold(
      backgroundColor: const Color(0xFF121343),
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.sunny_snowing,
                      color: Color(0XFFE1B626), size: 150.0),
                  const SizedBox(height: 200.0),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Find your',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0XFFE1B626),
                              fontSize: 30.0,
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Text(
                            'weather',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(Colors.white.value),
                              fontSize: 30.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'predictions in your',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(Colors.white.value),
                              fontSize: 30.0,
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          const Text(
                            'city',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0XFFE1B626),
                              fontSize: 30.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  Text(
                    'Easy steps to predict the weather and make your day easier',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(Colors.white.value), fontSize: 16.0),
                  )
                ],
              ),
            ),
            const SizedBox(height: 100.0),
            GradientButton(
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              buttonText: 'Get Location',
              onPressed: getCurrentLocationAndWeather,
            )
          ],
        ),
      ),
    );
  }
}
