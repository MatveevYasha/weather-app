// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/weather_notifier.dart';
import 'package:weather_app/theme/text_theme.dart';
import 'package:weather_app/ui/city_search_screen/widgets/custom_button.dart';
import 'package:weather_app/ui/city_search_screen/widgets/custom_text_field.dart';
import 'package:weather_app/ui/weather_show_screen/weather_show_screen.dart';

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
              child: CustomTextField(controller: _controller),
            ),
            const Spacer(),
            CustomButton(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  context.read<WeatherNotifier>().load(_controller.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WeatherShowScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      duration: const Duration(milliseconds: 750),
                      content: Center(
                        child: Text(
                          'Enter error',
                          style: textTheme.titleMedium,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
