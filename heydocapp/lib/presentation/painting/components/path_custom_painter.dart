import 'package:flutter/material.dart';

class PathPainter extends CustomPainter {
  Path path;
  PathPainter({required this.path});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.bevel
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(PathPainter oldDelegate) => true;
}
