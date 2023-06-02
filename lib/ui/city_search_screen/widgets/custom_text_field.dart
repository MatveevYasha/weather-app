import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/hive/boxes.dart';
import 'package:weather_app/domain/weather_notifier.dart';
import 'package:weather_app/ui/city_search_screen/city_search_screen.dart';
import 'package:weather_app/ui/weather_show_screen/weather_show_screen.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        onTap: () {
          if (boxCities.isNotEmpty &&
              Provider.of<WeatherNotifier>(context, listen: false)
                      .worryButton ==
                  true) {
            context.read<WeatherNotifier>().getLastCity(boxCities.length);
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text(
                    'Last viewed city: ${context.watch<WeatherNotifier>().lastSaveCity}'),
                content:
                    const Text('Do you want to go straight to the weather?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () =>
                        context.read<WeatherNotifier>().clearCity(),
                    child: const Text(
                      'Clear db',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<WeatherNotifier>().dontWorry();
                      Navigator.pop(context, 'No');
                    },
                    child: const Text(
                      'No',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<WeatherNotifier>().load(
                          Provider.of<WeatherNotifier>(context, listen: false)
                              .lastSaveCity);
                      _controller.clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WeatherShowScreen()),
                      );
                    },
                    child: const Text('Yes'),
                  ),
                ],
              ),
            );
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the text';
          }
          if (value.contains(RegExp(r'\d'))) {
            return 'Please enter the text, not number';
          }
          if (value.toUpperCase().contains(RegExp(r'[А-Я]'))) {
            return 'Please enter the text in English';
          }
          return null;
        },
        controller: _controller,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(width: 2, color: Colors.red),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          hintText: 'City',
          errorStyle: const TextStyle(
              color: Color.fromARGB(255, 160, 35, 26),
              fontWeight: FontWeight.bold),
          hintStyle: const TextStyle(color: Colors.grey),
          fillColor: Colors.grey[100],
          filled: true,
        ),
      ),
    );
  }
}
