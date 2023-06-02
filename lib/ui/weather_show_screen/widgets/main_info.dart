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
        Image.network(
          'https://openweathermap.org/img/wn/${data.list.first.weather.first.icon}@2x.png',
          errorBuilder: (context, error, stackTrace) {
            return Image.asset('assets/images/no_image.png');
          },
        ),
        Text(
          '${data.list.first.main.temp.round()}\u2103',
          style: textTheme.displayLarge,
        ),
      ],
    );
  }
}
