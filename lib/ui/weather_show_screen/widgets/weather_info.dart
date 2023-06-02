import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/weather_api.dart';
import 'package:weather_app/domain/weather_notifier.dart';
import 'package:weather_app/theme/text_theme.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:weather_app/ui/weather_show_screen/widgets/custom_arrow_painter.dart';
import 'package:weather_app/ui/weather_show_screen/widgets/custom_weather_painter.dart';
import "dart:math" show pi;

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var data = context.watch<WeatherNotifier>().data;
    return Padding(
      padding: const EdgeInsets.only(left: 13, right: 19, top: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // header
            Stack(
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
                      child: const Text('Back'),
                    ),
                    Text(
                      data.list.first.dtTxt
                          .split(' ')[1]
                          .split(':')
                          .getRange(0, 2)
                          .join(':'),
                    ),
                  ],
                ),
              ],
            ),
            // main info
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                toBeginningOfSentenceCase(
                    data.list.first.weather.first.description)!,
                style: textTheme.displayMedium,
              ),
            ),
            Row(
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
            ),
            Text(
              'Feels like ${data.list.first.main.feelsLike.round()}\u2103',
              style: textTheme.displayMedium,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            // доп info
            _DetailDescription(
              data: data,
              description: 'Humidity',
              meaning: '${data.list.first.main.humidity.round()}%',
            ),
            _DetailDescription(
              data: data,
              description: 'Pressure',
              meaning: '${data.list.first.main.pressure.round()} mmHg',
            ),
            _DetailDescription(
              data: data,
              description: 'Wind',
              meaning: '${data.list.first.wind.speed.round()} m/s',
            ),
            // компас
            Stack(
              children: [
                CustomPaint(
                  painter: CustomWeatherPainter(
                    windDirection: data.list.first.wind.deg,
                  ),
                ),
                Transform.rotate(
                  origin: const Offset(0, 100),
                  angle: (data.list.first.wind.deg) / (pi),
                  child: CustomPaint(
                    painter: CustomArrowPainter(
                      windDirection: data.list.first.wind.deg,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
                height:
                    230), // заменить на контейнер, сделать что то с размером 200

            // информация на 3 дня
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFF4A4A4A),
                borderRadius: BorderRadius.circular(20),
              ),
              height: MediaQuery.of(context).size.height * 0.7,
              width: double.infinity,
              child: DefaultTextStyle(
                style: textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.w500),
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
                                Text(
                                    '${data.list.first.main.humidity.round()}%'),
                                Text(
                                    '${data.list.first.main.pressure.round()}'),
                                Text('${data.list.first.wind.speed.round()}'),
                                SizedBox(width: 15),
                                Image.asset(
                                  'assets/images/${data.list.first.weather.first.icon}.png',
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
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailDescription extends StatelessWidget {
  final String description;
  final String meaning;

  const _DetailDescription({
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
