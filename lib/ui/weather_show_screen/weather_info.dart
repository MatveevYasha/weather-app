import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/hive/boxes.dart';
import 'package:weather_app/domain/weather_notifier.dart';
import 'package:weather_app/theme/text_theme.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:weather_app/ui/weather_show_screen/widgets/detail_description.dart';
import 'package:weather_app/ui/weather_show_screen/widgets/header.dart';
import 'package:weather_app/ui/weather_show_screen/widgets/main_info.dart';
import 'package:weather_app/ui/weather_show_screen/widgets/three_days_forecast.dart';
import 'package:weather_app/ui/weather_show_screen/widgets/wind_direction.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var data = context.watch<WeatherNotifier>().data;
    print('Save: ${data.city.name}');
    print('Lenght1: ${boxCities.length}');
    context.read<WeatherNotifier>().saveCity(data.city.name);
    return Padding(
      padding: const EdgeInsets.only(left: 13, right: 19, top: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(data: data),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                toBeginningOfSentenceCase(
                    data.list.first.weather.first.description)!,
                style: textTheme.displayMedium,
              ),
            ),
            MainInfo(data: data),
            Text(
              'Feels like ${data.list.first.main.feelsLike.round()}\u2103',
              style: textTheme.displayMedium,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            DetailDescription(
              data: data,
              description: 'Humidity',
              meaning: '${data.list.first.main.humidity.round()}%',
            ),
            DetailDescription(
              data: data,
              description: 'Pressure',
              meaning: '${data.list.first.main.pressure.round()} mmHg',
            ),
            DetailDescription(
              data: data,
              description: 'Wind',
              meaning: '${data.list.first.wind.speed.round()} m/s',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: WindDirection(data: data),
            ),
            ThreeDaysForecast(data: data),
          ],
        ),
      ),
    );
  }
}
