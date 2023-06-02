import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/weather_notifier.dart';
import 'package:weather_app/theme/text_theme.dart';
import 'package:weather_app/ui/weather_show_screen/weather_show_screen.dart';

class CitySearchScreen extends StatefulWidget {
  const CitySearchScreen({super.key});

  @override
  State<CitySearchScreen> createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends State<CitySearchScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Weather',
                style: textTheme.displayLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    borderSide:
                        BorderSide(width: 1, color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    borderSide:
                        BorderSide(width: 1, color: Colors.grey.shade300),
                  ),
                  hintText: 'City',
                  hintStyle: const TextStyle(color: Colors.grey),
                  fillColor: Colors.grey[100],
                  filled: true,
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                // context.read<WeatherNotifier>().load(_controller.text);
                context.read<WeatherNotifier>().load('saratov');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WeatherShowScreen()),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(right: 16, left: 16, bottom: 50),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                    child: Text('Get the weather forecast',
                        style: textTheme.titleMedium!
                            .copyWith(color: Colors.black))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
