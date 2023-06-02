import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/theme/text_theme.dart';
import 'package:weather_app/ui/city_search_screen.dart';

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
          seedColor: Colors.white,
          primary: Colors.black,
          background: const Color(0xFF359EFF),
        ),
        textTheme: textTheme,
        useMaterial3: true,
      ),
      home: const CitySearchScreen(),
    );
  }
}
