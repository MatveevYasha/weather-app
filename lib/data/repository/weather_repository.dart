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
    try {
      final responce = await dio.get(
          'http://api.openweathermap.org/data/2.5/weather?q=$cityName,ru&units=metric&APPID=62b3007ab0b0b2b46cc05af643ea9dc0');
      final weather = WeatherApi.fromJson(responce.data);
      return weather;
    } catch (e) {
      throw Exception('Loading error in repository: $e');
    }
  }
}
