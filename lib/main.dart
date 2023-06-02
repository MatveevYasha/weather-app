import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/hive/boxes.dart';
import 'package:weather_app/data/hive/hive_city.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/domain/weather_notifier.dart';
import 'package:weather_app/ui/weather_app.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(HiveCityAdapter());
  boxCities = await Hive.openBox<HiveCity>('cityBox');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WeatherNotifier(const NetWeatherRepository()),
        ),
      ],
      child: const WeatherApp(),
    ),
  );
}
