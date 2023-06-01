import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/weather_notifier.dart';
import 'package:weather_app/theme/text_theme.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var data = context.watch<WeatherNotifier>().data;
    return Padding(
      padding: const EdgeInsets.only(left: 13, right: 19),
      child: Column(
        children: [
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              ),
              Expanded(
                  child: Center(
                child: Text(
                  data.name,
                  style: textTheme.displayLarge,
                ),
              )),
              Text('Время'),
            ],
          ),
          Column(
            children: [
              Text(toBeginningOfSentenceCase(data.weather.first.description)!),
              Image.asset('assets/images/${data.weather.first.icon}.png'),
              Text(data.main.temp.toString())
            ],
          ),
        ],
      ),
    );
  }
}
