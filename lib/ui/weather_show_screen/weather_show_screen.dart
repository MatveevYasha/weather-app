import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/weather_notifier.dart';
import 'package:weather_app/theme/text_theme.dart';
import 'package:weather_app/ui/weather_show_screen/weather_info.dart';
import 'package:weather_app/ui/weather_show_screen/widgets/custom_alert_dialog.dart';

class WeatherShowScreen extends StatefulWidget {
  const WeatherShowScreen({super.key});

  @override
  State<WeatherShowScreen> createState() => _WeatherShowScreenState();
}

class _WeatherShowScreenState extends State<WeatherShowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (context.watch<WeatherNotifier>().hasError)
          ? AppBar(
              centerTitle: false,
              backgroundColor: const Color(0xFF359EFF),
              automaticallyImplyLeading: false,
              title: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Back',
                  style: textTheme.titleLarge,
                ),
              ),
            )
          : null,
      body: SafeArea(
        child: (context.watch<WeatherNotifier>().hasError)
            ? Center(
                child: GestureDetector(
                  onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) =>
                          const CustomAlertDialog()),
                  child: Text(
                    'Something went wrong..',
                    style: textTheme.titleLarge,
                  ),
                ),
              )
            : (context.watch<WeatherNotifier>().isLoading)
                ? const Center(child: CircularProgressIndicator())
                : const WeatherInfo(),
      ),
    );
  }
}
