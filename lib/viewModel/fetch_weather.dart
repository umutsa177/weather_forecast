import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_forecast/model/weather_data.dart';
import 'package:weather_forecast/model/weather_data_current.dart';
import 'package:weather_forecast/utils/api_url.dart';

class FetchWeather {
  WeatherData? weatherData;

  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = json.decode(response.body) as Map<String, dynamic>;

    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString));

    return weatherData!;
  }
}
