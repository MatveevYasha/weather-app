import 'package:flutter/material.dart';
import 'package:weather_app/ui/city_search_screen/city_search_screen.dart';

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
