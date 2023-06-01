import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/domain/weather_notifier.dart';
import 'package:weather_app/ui/weather_app.dart';

void main() {
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
