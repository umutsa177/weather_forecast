import 'package:weather_forecast/model/weather_forecast/clouds.dart';
import 'package:weather_forecast/model/weather_forecast/main.dart';
import 'package:weather_forecast/model/weather_forecast/weather.dart';
import 'package:weather_forecast/model/weather_forecast/wind.dart';

class WeatherDataCurrent {
  final WeatherForecast current;

  WeatherDataCurrent({required this.current});

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(
          current: WeatherForecast.fromJson(
              json['current'] as Map<String, dynamic>));
}

class WeatherForecast {
  List<Weather>? weather;
  Main? main;
  Wind? wind;
  Clouds? clouds;

  WeatherForecast({
    this.weather,
    this.main,
    this.wind,
    this.clouds,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    return WeatherForecast(
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      main: json['main'] == null
          ? null
          : Main.fromJson(json['main'] as Map<String, dynamic>),
      wind: json['wind'] == null
          ? null
          : Wind.fromJson(json['wind'] as Map<String, dynamic>),
      clouds: json['clouds'] == null
          ? null
          : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'weather': weather?.map((e) => e.toJson()).toList(),
        'main': main?.toJson(),
        'wind': wind?.toJson(),
        'clouds': clouds?.toJson(),
      };
}
