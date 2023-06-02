import 'package:flutter/foundation.dart';
import 'package:weather_app/data/hive/boxes.dart';
import 'package:weather_app/data/hive/hive_city.dart';
import 'package:weather_app/data/models/weather_api.dart';
import 'package:weather_app/data/repository/weather_repository.dart';

class WeatherNotifier with ChangeNotifier {
  final WeatherRepository _weatherRepository;
  WeatherNotifier(this._weatherRepository);

  late WeatherApi data;
  bool isLoading = true;
  bool hasError = false;
  String errorMessage = '';
  String lastSaveCity = '';
  bool worryButton = true;

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
      if (e.toString().contains('404')) {
        errorMessage = 'There is no such city';
      } else {
        if (e.toString().contains('null')) {
          errorMessage = 'Сheck your internet connection';
        } else {
          errorMessage = 'Unknown error';
        }
      }
    }
    notifyListeners();
  }

  void saveCity(String name) {
    boxCities.put('key_${DateTime.now()}', HiveCity(name: name));
  }

  void clearCity() {
    boxCities.clear();
  }

  void dontWorry() {
    worryButton = false;
    notifyListeners();
  }

  void getLastCity(int lenght) {
    HiveCity ct = boxCities.getAt(lenght - 1);
    lastSaveCity = ct.name;
    notifyListeners();
  }
}
