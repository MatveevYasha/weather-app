import 'package:flutter/material.dart';
import 'package:weather_app/data/models/weather_api.dart';
import 'package:weather_app/theme/text_theme.dart';

class MainInfo extends StatelessWidget {
  const MainInfo({
    super.key,
    required this.data,
  });

  final WeatherApi data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/${data.list.first.weather.first.icon}.png',
          scale: 0.7,
        ),
        Text(
          '${data.list.first.main.temp.round()}\u2103',
          style: textTheme.displayLarge,
        ),
      ],
    );
  }
}
