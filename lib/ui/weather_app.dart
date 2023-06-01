import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/theme/text_theme.dart';
import 'package:weather_app/ui/city_search_screen.dart';
import 'package:weather_app/ui/weather_screen.dart';

final dio = Dio();

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 0, 0, 0),
          primary: const Color(0xFF5DB075),
        ),
        textTheme: textTheme,
        useMaterial3: true,
      ),
      home: WeatherScreen(),
    );
  }
}
