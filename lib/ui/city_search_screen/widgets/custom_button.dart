import 'package:flutter/material.dart';
import 'package:weather_app/theme/text_theme.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  void Function() onTap;
  CustomButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                style: textTheme.titleMedium!.copyWith(color: Colors.black))),
      ),
    );
  }
}
