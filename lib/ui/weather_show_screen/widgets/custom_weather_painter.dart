import 'package:flutter/material.dart';

class CustomWeatherPainter extends CustomPainter {
  CustomWeatherPainter();
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        const Offset(0, 100),
        100,
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5);
    canvas.drawLine(
        const Offset(-100, 100),
        const Offset(100, 100),
        Paint()
          ..color = Colors.black
          ..strokeWidth = 5);
    canvas.drawLine(
        const Offset(0, 0),
        const Offset(0, 200),
        Paint()
          ..color = Colors.black
          ..strokeWidth = 5);
  }

  @override
  bool shouldRepaint(CustomWeatherPainter oldDelegate) => false;
}
