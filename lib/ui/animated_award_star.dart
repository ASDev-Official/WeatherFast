import 'dart:math' as math;

import 'package:flutter/material.dart';

class AnimatedAwardStar extends StatefulWidget {
  final double size;
  const AnimatedAwardStar({super.key, this.size = 80});

  @override
  State<AnimatedAwardStar> createState() => _AnimatedAwardStarState();
}

class _AnimatedAwardStarState extends State<AnimatedAwardStar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shineGrow;
  late Animation<double> _shineFade;
  late Animation<double> _shellProgress;
  late Animation<double> _ribbonProgress;
  late Animation<double> _elementsFade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    _shineGrow = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOutCubic),
      ),
    );

    _shineFade = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.45, curve: Curves.easeIn),
      ),
    );

    _shellProgress = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.35, 0.7, curve: Curves.easeInOutCubic),
      ),
    );

    _ribbonProgress = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.65, 0.8, curve: Curves.easeOutBack),
      ),
    );

    // Fades out only the shell and ribbons at the end to seamlessly loop
    _elementsFade = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.85, 1.0, curve: Curves.easeIn),
      ),
    );

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _AwardStarPainter(
              shineGrow: _shineGrow.value,
              shineFade: _shineFade.value,
              shellProgress: _shellProgress.value,
              ribbonProgress: _ribbonProgress.value,
              elementsFade: _elementsFade.value,
            ),
            child: Center(
              child: Icon(
                Icons.star_rounded,
                size: widget.size * 0.5,
                color: Colors.amber.shade400,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AwardStarPainter extends CustomPainter {
  final double shineGrow;
  final double shineFade;
  final double shellProgress;
  final double ribbonProgress;
  final double elementsFade;

  _AwardStarPainter({
    required this.shineGrow,
    required this.shineFade,
    required this.shellProgress,
    required this.ribbonProgress,
    required this.elementsFade,
  });

  Path _buildSquigglyLine(
    Offset center,
    double angle,
    double startRadius,
    double endRadius,
  ) {
    final path = Path();
    final int steps = 80;
    final double length = endRadius - startRadius;
    final double amplitude = 2.0; // Very subtle amplitude
    final double frequency =
        math.pi * 1.5; // Much lower frequency (gentle wave)

    for (int i = 0; i <= steps; i++) {
      final double t = i / steps;
      final double d = startRadius + t * length;

      // Sine wave offset perpendicular to the main angle
      final double perpOffset = amplitude * math.sin(t * frequency);

      final double x =
          center.dx +
          d * math.cos(angle) +
          perpOffset * math.cos(angle + math.pi / 2);
      final double y =
          center.dy +
          d * math.sin(angle) +
          perpOffset * math.sin(angle + math.pi / 2);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    return path;
  }

  Path _buildSquigglyArc(
    Offset center,
    double baseRadius,
    double startAngle,
    double sweepAngle,
  ) {
    final path = Path();
    if (sweepAngle <= 0) return path;

    final int steps = 180;
    final double amplitude = 2.0; // Very subtle amplitude
    final double frequency =
        16.0; // Higher frequency (16 full waves around circle)

    for (int i = 0; i <= steps; i++) {
      final double t = i / steps;
      final double currentAngle = startAngle + t * sweepAngle;

      // Sine wave offset added to radius
      final double r =
          baseRadius + amplitude * math.sin(currentAngle * frequency);

      final double x = center.dx + r * math.cos(currentAngle);
      final double y = center.dy + r * math.sin(currentAngle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = size.width / 2;

    // 1. Draw Squiggly Shine Lines (Straight angles: Right, Down, Left, Up)
    if (shineGrow > 0 && shineFade > 0) {
      final shinePaint = Paint()
        ..color = Colors.amber.shade400.withValues(alpha: shineFade)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3.5
        ..strokeCap = StrokeCap.round;

      final numShines = 4;
      for (int i = 0; i < numShines; i++) {
        final angle =
            i * math.pi / 2 +
            math.pi / 4; // perfectly straight lines, at 45 degree diagonals

        final startRadius = maxRadius * 0.35;
        final endRadius = maxRadius * 0.95;

        final path = _buildSquigglyLine(center, angle, startRadius, endRadius);

        // Slowly draw the path
        final pathMetrics = path.computeMetrics().toList();
        if (pathMetrics.isNotEmpty) {
          final metric = pathMetrics.first;
          final extractPath = metric.extractPath(
            0.0,
            metric.length * shineGrow,
          );
          canvas.drawPath(extractPath, shinePaint);
        }
      }
    }

    // 2. Draw Squiggly Outer Award Shell
    if (shellProgress > 0 && elementsFade > 0) {
      final shellPaint = Paint()
        ..color = Colors.amber.shade500.withValues(alpha: elementsFade)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4.0
        ..strokeCap = StrokeCap.round;

      final startAngle = -math.pi / 2; // Top
      // We generate the full 2pi path first, so the squiggles stay perfectly static in place
      final fullArcPath = _buildSquigglyArc(
        center,
        maxRadius * 0.75,
        startAngle,
        2 * math.pi,
      );

      // Slowly draw the arc
      final arcMetrics = fullArcPath.computeMetrics().toList();
      if (arcMetrics.isNotEmpty) {
        final metric = arcMetrics.first;
        final extractPath = metric.extractPath(
          0.0,
          metric.length * shellProgress,
        );
        canvas.drawPath(extractPath, shellPaint);
      }

      // 3. Draw Ribbons
      if (ribbonProgress > 0) {
        final ribbonPaint = Paint()
          ..color = Colors.amber.shade600.withValues(alpha: elementsFade)
          ..style = PaintingStyle.fill;

        // Left ribbon tail
        final leftRibbon = Path()
          ..moveTo(center.dx - 12, center.dy + maxRadius * 0.65)
          ..quadraticBezierTo(
            center.dx - 32 * ribbonProgress,
            center.dy + maxRadius * 0.8 * ribbonProgress,
            center.dx - 26 * ribbonProgress,
            center.dy + maxRadius * 1.1 * ribbonProgress,
          )
          ..quadraticBezierTo(
            center.dx - 16 * ribbonProgress,
            center.dy + maxRadius * 0.95 * ribbonProgress,
            center.dx - 8 * ribbonProgress,
            center.dy + maxRadius * 0.95 * ribbonProgress,
          )
          ..lineTo(center.dx - 2, center.dy + maxRadius * 0.7)
          ..close();
        canvas.drawPath(leftRibbon, ribbonPaint);

        // Right ribbon tail
        final rightRibbon = Path()
          ..moveTo(center.dx + 12, center.dy + maxRadius * 0.65)
          ..quadraticBezierTo(
            center.dx + 32 * ribbonProgress,
            center.dy + maxRadius * 0.8 * ribbonProgress,
            center.dx + 26 * ribbonProgress,
            center.dy + maxRadius * 1.1 * ribbonProgress,
          )
          ..quadraticBezierTo(
            center.dx + 16 * ribbonProgress,
            center.dy + maxRadius * 0.95 * ribbonProgress,
            center.dx + 8 * ribbonProgress,
            center.dy + maxRadius * 0.95 * ribbonProgress,
          )
          ..lineTo(center.dx + 2, center.dy + maxRadius * 0.7)
          ..close();
        canvas.drawPath(rightRibbon, ribbonPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _AwardStarPainter oldDelegate) {
    return shineGrow != oldDelegate.shineGrow ||
        shineFade != oldDelegate.shineFade ||
        shellProgress != oldDelegate.shellProgress ||
        ribbonProgress != oldDelegate.ribbonProgress ||
        elementsFade != oldDelegate.elementsFade;
  }
}
