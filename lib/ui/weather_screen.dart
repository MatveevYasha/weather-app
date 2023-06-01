import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_api.dart';
import 'package:weather_app/theme/text_theme.dart';
import 'package:weather_app/ui/weather_app.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  bool isLoading = true;
  late WeatherApi data;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _loadWeather(String cityName) async {
    try {
      final responce = await dio.get(
          'http://api.openweathermap.org/data/2.5/weather?q=$cityName,ru&units=metric&APPID=62b3007ab0b0b2b46cc05af643ea9dc0');
      final weather = WeatherApi.fromJson(responce.data);

      data = weather;
      print(weather);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      throw Exception('Loading error in repository: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 13, right: 19),
          child: Column(
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text('Back'),
                  ),
                  Expanded(
                      child: Center(
                    child: Text(
                      'Город',
                      style: textTheme.displayLarge,
                    ),
                  )),
                  Text('Время'),
                ],
              ),
              (isLoading)
                  ? ElevatedButton(
                      onPressed: () {
                        _loadWeather('tyumen');
                      },
                      child: Text('load'),
                    )
                  : Column(
                      children: [
                        Text(data.name),
                        Image.asset(
                            'assets/images/${data.weather.first.icon}.png')
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
