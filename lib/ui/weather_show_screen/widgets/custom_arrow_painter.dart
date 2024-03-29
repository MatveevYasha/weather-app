import 'package:flutter/material.dart';

class CustomArrowPainter extends CustomPainter {
  final Color color;
  CustomArrowPainter({
    required this.color,
  });
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
        const Offset(0, 0),
        const Offset(0, 200),
        Paint()
          ..color = color
          ..strokeWidth = 6);
    canvas.drawLine(
        const Offset(0, 0),
        const Offset(20, 50),
        Paint()
          ..color = color
          ..strokeWidth = 6);
    canvas.drawLine(
        const Offset(0, 0),
        const Offset(-20, 50),
        Paint()
          ..color = color
          ..strokeWidth = 6);
  }

  @override
  bool shouldRepaint(CustomArrowPainter oldDelegate) => false;
}
