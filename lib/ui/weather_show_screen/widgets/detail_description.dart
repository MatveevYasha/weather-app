import 'package:flutter/material.dart';
import 'package:weather_app/data/models/weather_api.dart';
import 'package:weather_app/theme/text_theme.dart';

class DetailDescription extends StatelessWidget {
  final String description;
  final String meaning;

  const DetailDescription({
    super.key,
    required this.data,
    required this.description,
    required this.meaning,
  });

  final WeatherApi data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2, left: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              description,
              style: textTheme.displayMedium,
            ),
          ),
          Expanded(
            child: Text(
              meaning,
              style: textTheme.displayMedium,
            ),
          ),
        ],
      ),
    );
  }
}
