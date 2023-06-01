import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/weather_notifier.dart';
import 'package:weather_app/ui/weather_show_screen/widgets/weather_info.dart';

class WeatherShowScreen extends StatefulWidget {
  const WeatherShowScreen({super.key});

  @override
  State<WeatherShowScreen> createState() => _WeatherShowScreenState();
}

class _WeatherShowScreenState extends State<WeatherShowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: (context.watch<WeatherNotifier>().isLoading)
            ? const Center(child: CircularProgressIndicator())
            : const WeatherInfo(),
      ),
    );
  }
}
