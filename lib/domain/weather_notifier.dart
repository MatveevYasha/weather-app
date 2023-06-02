import 'package:flutter/foundation.dart';
import 'package:weather_app/data/models/weather_api.dart';
import 'package:weather_app/data/repository/weather_repository.dart';

class WeatherNotifier with ChangeNotifier {
  final WeatherRepository _weatherRepository;
  WeatherNotifier(this._weatherRepository);

  late WeatherApi data;
  bool isLoading = true;
  bool hasError = false;
  String errorString = '';

  void load(String cityName) async {
    try {
      hasError = false;
      isLoading = true;
      final rep = await _weatherRepository.loading(cityName);
      data = rep;
      isLoading = false;
    } catch (e) {
      hasError = true;
      isLoading = false;
      errorString = e.toString();
    }

    notifyListeners();
  }
}
