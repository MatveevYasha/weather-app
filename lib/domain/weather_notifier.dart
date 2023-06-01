import 'package:flutter/foundation.dart';
import 'package:weather_app/data/models/weather_api.dart';
import 'package:weather_app/data/repository/weather_repository.dart';

class WeatherNotifier with ChangeNotifier {
  final WeatherRepository _weatherRepository;
  WeatherNotifier(this._weatherRepository);

  // int userBalance = 10000;
  late WeatherApi data;
  bool isLoading = true;

  void load(String cityName) async {
    final rep = await _weatherRepository.loading(cityName);
    data = rep;
    isLoading = false;
    notifyListeners();
  }
}
