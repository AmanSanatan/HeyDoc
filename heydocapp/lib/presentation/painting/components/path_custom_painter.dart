import 'package:flutter/material.dart';

class PathPainter extends CustomPainter {
  List<Path> paths;
  PathPainter({required this.paths});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.bevel
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    for (var path in paths) {
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(PathPainter oldDelegate) => true;
}
