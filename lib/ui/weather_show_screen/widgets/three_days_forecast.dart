import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_app/data/models/weather_api.dart';
import 'package:weather_app/theme/text_theme.dart';

class ThreeDaysForecast extends StatelessWidget {
  const ThreeDaysForecast({
    super.key,
    required this.data,
  });

  final WeatherApi data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF4A4A4A),
        borderRadius: BorderRadius.circular(20),
      ),
      height: MediaQuery.of(context).size.height * 0.7,
      width: double.infinity,
      child: DefaultTextStyle(
        style: textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Text(
                'Forecast for 3 days',
                style: textTheme.titleMedium,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Time'),
                  Text('t\u00B0'),
                  Text('Hum'),
                  Text('Pres'),
                  Text('Wind'),
                  Text('Wx'),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: data.list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.list[index].dtTxt
                              .split(' ')[1]
                              .split(':')
                              .getRange(0, 2)
                              .join(':'),
                        ),
                        Text(
                          '${data.list[index].main.temp.round()}\u2103',
                        ),
                        Text('${data.list.first.main.humidity.round()}%'),
                        Text('${data.list.first.main.pressure.round()}'),
                        Text('${data.list.first.wind.speed.round()}'),
                        Transform.rotate(
                          angle: (data.list[index].wind.deg) / (pi),
                          child: const Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                          ),
                        ),
                        Image.network(
                          'https://openweathermap.org/img/wn/${data.list.first.weather.first.icon}@2x.png',
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset('assets/images/no_image.png');
                          },
                          scale: 3,
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
