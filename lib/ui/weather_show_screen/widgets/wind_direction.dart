import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_app/data/models/weather_api.dart';
import 'package:weather_app/ui/weather_show_screen/widgets/custom_arrow_painter.dart';
import 'package:weather_app/ui/weather_show_screen/widgets/custom_weather_painter.dart';

class WindDirection extends StatelessWidget {
  const WindDirection({
    super.key,
    required this.data,
  });

  final WeatherApi data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.25),
        CustomPaint(
          painter: CustomWeatherPainter(),
        ),
        Transform.rotate(
          origin: const Offset(0, 100),
          angle: (data.list.first.wind.deg) / (pi),
          child: CustomPaint(
            painter: CustomArrowPainter(
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
