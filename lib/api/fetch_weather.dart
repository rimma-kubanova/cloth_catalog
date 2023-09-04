import 'dart:convert';

import 'package:cloth_catalog_ios/api/api_key.dart';
import 'package:cloth_catalog_ios/model/weather_data.dart';
import 'package:cloth_catalog_ios/model/weather_data_current.dart';
import 'package:http/http.dart' as http;

class FetchWeatherAPI {
  WeatherData? weatherData;

  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);

    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString));

    return weatherData!;
  }
}

String apiURL(var lat, var lon) {
  String url =
      "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric&exclude=minutely";

  return url;
}
