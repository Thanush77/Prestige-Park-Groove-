import 'package:flutter/material.dart';
import 'dart:math' as math;

class ConsumptionRingPainter extends CustomPainter {
  final double totalValue;
  final double monthValue;
  final double dayValue;
  final Animation<double> animation;

  ConsumptionRingPainter({
    required this.totalValue,
    required this.monthValue,
    required this.dayValue,
    required this.animation,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.4;
    final strokeWidth = size.width * 0.08;

    // Draw background circles
    final bgPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = Colors.grey.withOpacity(0.2);

    canvas.drawCircle(center, radius, bgPaint);
    canvas.drawCircle(center, radius - strokeWidth * 1.5, bgPaint);
    canvas.drawCircle(center, radius - strokeWidth * 3, bgPaint);

    // Draw animated progress arcs
    final progress = animation.value;
    _drawProgressArc(canvas, center, radius, 
        (totalValue / 10000) * progress, Colors.blue, strokeWidth);
    _drawProgressArc(canvas, center, radius - strokeWidth * 1.5, 
        (monthValue / 5000) * progress, Colors.green, strokeWidth);
    _drawProgressArc(canvas, center, radius - strokeWidth * 3, 
        (dayValue / 100) * progress, Colors.orange, strokeWidth);

    // Draw center text
    _drawCenterText(canvas, center, totalValue.toInt());
  }

  void _drawProgressArc(Canvas canvas, Offset center, double radius, 
      double progress, Color color, double strokeWidth) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..color = color;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2, // Start from top
      progress * math.pi * 2 * animation.value,
      false,
      paint,
    );
  }

  void _drawCenterText(Canvas canvas, Offset center, int value) {
    final textPainter = TextPainter(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$value\n',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(
            text: 'Total Liters',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      center.translate(-textPainter.width / 2, -textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(ConsumptionRingPainter oldDelegate) =>
      oldDelegate.animation.value != animation.value;
}
