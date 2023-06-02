import 'package:flutter/material.dart';
import 'package:weather_app/data/models/weather_api.dart';
import 'package:weather_app/theme/text_theme.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.data,
  });

  final WeatherApi data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text(
            data.city.name,
            style: textTheme.displayLarge,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Back',
                style: textTheme.titleLarge,
              ),
            ),
            Text(
              data.list.first.dtTxt
                  .split(' ')[1]
                  .split(':')
                  .getRange(0, 2)
                  .join(':'),
              style: textTheme.titleLarge,
            ),
          ],
        ),
      ],
    );
  }
}
