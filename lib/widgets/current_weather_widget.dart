import 'package:cloth_catalog_ios/model/weather_data_current.dart';
import 'package:flutter/material.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        temperatureAreaWidget(),
      ],
    );
  }

  Widget temperatureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Image.asset(
              "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
              height: 96,
              width: 96,
            ),
            const SizedBox(width: 16),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "${weatherDataCurrent.current.temp!.toInt()}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    )),
              ]),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            weatherDetailsWidget(
                "Humidity", weatherDataCurrent.current.humidity!.toInt(), "%"),
            weatherDetailsWidget(
                "Clouds", weatherDataCurrent.current.clouds!.toInt(), "%"),
            weatherDetailsWidget("Wind Speed",
                weatherDataCurrent.current.windSpeed!.toInt(), "m/s"),
          ],
        ),
      ],
    );
  }

  Widget weatherDetailsWidget(String text, int weatherData, String unit) {
    return Text(
      "$text: $weatherData $unit",
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
