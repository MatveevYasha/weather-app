import 'package:weather_app/data/models/weather_api.dart';
import 'package:weather_app/ui/weather_app.dart';

abstract class WeatherRepository {
  const WeatherRepository();

  Future<WeatherApi> loading(String cityName);
}

class NetWeatherRepository extends WeatherRepository {
  const NetWeatherRepository();

  @override
  Future<WeatherApi> loading(String cityName) async {
    final responce = await dio.get(
        'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&units=metric&appid=apiKey');
    final weather = WeatherApi.fromJson(responce.data);
    return weather;
  }
}
