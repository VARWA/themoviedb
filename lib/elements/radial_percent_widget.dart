import 'dart:math';

import 'package:flutter/material.dart';

class RadialPercentWidget extends StatelessWidget {
  final Widget child;
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  const RadialPercentWidget({
    Key? key,
    required this.child,
    required this.percent,
    required this.fillColor,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
            painter: MyPainter(
          percent: percent,
          fillColor: fillColor,
          lineColor: lineColor,
          freeColor: freeColor,
          lineWidth: lineWidth,
        )),
        Padding(
            padding: const EdgeInsets.all(11),
            child: Center(
              child: child,
            ))
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  MyPainter(
      {required this.percent,
      required this.fillColor,
      required this.lineColor,
      required this.freeColor,
      required this.lineWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final Rect arcRect = calculateArcsRect(size);
    drawBackground(canvas, size);
    drawFreeArc(canvas, arcRect);
    drawFilledArc(canvas, size);
  }

  void drawFilledArc(Canvas canvas, Size size) {
    final feelPaint = Paint();
    feelPaint.color = lineColor;
    feelPaint.style = PaintingStyle.stroke;
    feelPaint.strokeWidth = lineWidth;
    feelPaint.strokeCap = StrokeCap.round;
    canvas.drawArc(
      Offset(5.5, 5.5) & Size(size.width - 11, size.height - 11),
      -pi / 2,
      pi * 2 * percent,
      false,
      feelPaint,
    );
  }

  void drawFreeArc(Canvas canvas, Rect arcRect) {
    final freePaint = Paint();
    freePaint.color = freeColor;
    freePaint.style = PaintingStyle.stroke;
    freePaint.strokeWidth = lineWidth;
    canvas.drawArc(
      arcRect,
      pi * 2 * percent - (pi / 2),
      pi * 2 * (1.0 - percent),
      false,
      freePaint,
    );
  }

  void drawBackground(Canvas canvas, Size size) {
    final backgroundPaint = Paint();
    backgroundPaint.color = fillColor;
    backgroundPaint.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, backgroundPaint);
  }

  Rect calculateArcsRect(Size size) {
    const linesMargin = 3;
    final offest = lineWidth / 2 + linesMargin;
    final arcRect = Offset(offest, offest) &
        Size(size.width - offest * 2, size.height - offest * 2);
    return arcRect;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
