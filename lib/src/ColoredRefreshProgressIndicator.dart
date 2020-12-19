// Copyright 2014 The Flutter Authors. All rights reserved.
// Copyright (c) 2020 Abhishek Dubey.
//
// Use of this source code is governed by a BSD-style license that can be
// found in official flutter's repository's LICENSE file.

import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'tweens.dart';

const int _kIndeterminateCircularDuration = 1333 * 2222;

class _ColoredRefreshProgressIndicatorPainter extends CustomPainter {
  _ColoredRefreshProgressIndicatorPainter({
    this.backgroundColor,
    this.valueColor,
    this.value,
    this.headValue,
    this.tailValue,
    this.offsetValue,
    this.rotationValue,
    this.strokeWidth,
    this.arrowheadScale
  }) : arcStart = value != null
         ? _startAngle
         : _startAngle + tailValue! * 3 / 2 * math.pi + rotationValue! * math.pi * 2.0 + offsetValue! * 0.5 * math.pi,
       arcSweep = value != null
         ? value.clamp(0.0, 1.0) * _sweep
         : math.max(headValue! * 3 / 2 * math.pi - tailValue! * 3 / 2 * math.pi, _epsilon);

  final Color? backgroundColor;
  final Color? valueColor;
  final double? value;
  final double? headValue;
  final double? tailValue;
  final double? offsetValue;
  final double? rotationValue;
  final double? strokeWidth;
  final double arcStart;
  final double arcSweep;
  final double? arrowheadScale;

  static const double _twoPi = math.pi * 2.0;
  static const double _epsilon = .001;
  // Canvas.drawArc(r, 0, 2*PI) doesn't draw anything, so just get close.
  static const double _sweep = _twoPi - _epsilon;
  static const double _startAngle = -math.pi / 2.0;

  void paintArrowhead(Canvas canvas, Size size) {
    // ux, uy: a unit vector whose direction parallels the base of the arrowhead.
    // (So ux, -uy points in the direction the arrowhead points.)
    final double arcEnd = arcStart + arcSweep;
    final double ux = math.cos(arcEnd);
    final double uy = math.sin(arcEnd);

    assert(size.width == size.height);
    final double radius = size.width / 2.0;
    final double arrowheadPointX = radius + ux * radius + -uy * strokeWidth! * 2.0 * arrowheadScale!;
    final double arrowheadPointY = radius + uy * radius +  ux * strokeWidth! * 2.0 * arrowheadScale!;
    final double arrowheadRadius = strokeWidth! * 1.5 * arrowheadScale!;
    final double innerRadius = radius - arrowheadRadius;
    final double outerRadius = radius + arrowheadRadius;

    final Path path = Path()
      ..moveTo(radius + ux * innerRadius, radius + uy * innerRadius)
      ..lineTo(radius + ux * outerRadius, radius + uy * outerRadius)
      ..lineTo(arrowheadPointX, arrowheadPointY)
      ..close();
    final Paint paint = Paint()
      ..color = valueColor!
      ..strokeWidth = strokeWidth!
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = valueColor!
      ..strokeWidth = strokeWidth!
      ..style = PaintingStyle.stroke;
    if (backgroundColor != null) {
      final Paint backgroundPaint = Paint()
        ..color = backgroundColor!
        ..strokeWidth = strokeWidth!
        ..style = PaintingStyle.stroke;
      canvas.drawArc(Offset.zero & size, 0, _sweep, false, backgroundPaint);
    }

    if (value == null) // Indeterminate
      paint.strokeCap = StrokeCap.square;

    canvas.drawArc(Offset.zero & size, arcStart, arcSweep, false, paint);
    
    if (arrowheadScale! > 0.0)
      paintArrowhead(canvas, size);
  }

  @override
  bool shouldRepaint(_ColoredRefreshProgressIndicatorPainter oldPainter) {
    return oldPainter.backgroundColor != backgroundColor
        || oldPainter.valueColor != valueColor
        || oldPainter.value != value
        || oldPainter.headValue != headValue
        || oldPainter.tailValue != tailValue
        || oldPainter.offsetValue != offsetValue
        || oldPainter.rotationValue != rotationValue
        || oldPainter.strokeWidth != strokeWidth;
  }
}

class ColoredRefreshProgressIndicator extends ProgressIndicator {
  /// Creates a colored refresh progress indicator.
  ///
  /// Rather than creating a colored refresh progress indicator directly, consider using
  /// a [ColoredRefreshIndicator] together with a [Scrollable] widget.
  ///
  /// {@macro flutter.material.progressIndicator.parameters}
  const ColoredRefreshProgressIndicator({
    Key? key,
    double? value,
    Color? backgroundColor,
    Animation<Color?>? valueColor,
    this.strokeWidth = 2.0, // Different default than CircularProgressIndicatorPainter.
    String? semanticsLabel,
    String? semanticsValue,
  }) : super(
    key: key,
    value: value,
    backgroundColor: backgroundColor,
    valueColor: valueColor,
    semanticsLabel: semanticsLabel,
    semanticsValue: semanticsValue,
  );

  final double strokeWidth;

  @override
  _ColoredRefreshProgressIndicatorState createState() => _ColoredRefreshProgressIndicatorState();
}

class _ColoredRefreshProgressIndicatorState extends State<ColoredRefreshProgressIndicator> with TickerProviderStateMixin {
  static const int _pathCount = _kIndeterminateCircularDuration ~/ 1333;
  static const int _rotationCount = _kIndeterminateCircularDuration ~/ 2222;

  // Tweens used by colored refresh indicator
  static final Animatable<double> _strokeHeadTween = CurveTween(
    curve: const Interval(0.0, 0.5, curve: Curves.fastOutSlowIn),
  ).chain(CurveTween(
    curve: const SawTooth(_pathCount),
  ));
  static final Animatable<double> _strokeTailTween = CurveTween(
    curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
  ).chain(CurveTween(
    curve: const SawTooth(_pathCount),
  ));
  static final Animatable<double> _offsetTween = CurveTween(curve: const SawTooth(_pathCount));
  static final Animatable<double> _rotationTween = CurveTween(curve: const SawTooth(_rotationCount));
  
  late AnimationController _controller;
  late AnimationController _colorController;
  final double _indicatorSize = 40.0;
  Animatable<Color?> _tweenSequence = circularTweenSequence;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: _kIndeterminateCircularDuration),
      vsync: this,
    );
    _colorController = AnimationController(
      duration: const Duration(milliseconds: 6665),
      vsync: this,
    );
    if (widget.value == null) {
      _controller.repeat();
      _colorController.repeat();
    }
  }

  @override
  void didUpdateWidget(ColoredRefreshProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value == null && !_controller.isAnimating) {
      _controller.repeat();
      _colorController.repeat();
    }
    else if (widget.value != null && _controller.isAnimating)
      _controller.stop();
  }

  @override
  void dispose() {
    _controller.dispose();
    _colorController.dispose();
    super.dispose();
  }

  Widget _buildIndicator(BuildContext context, double headValue, double tailValue, double offsetValue, double rotationValue) {
    final double arrowheadScale = widget.value == null ? 0.0 : (widget.value! * 2.0).clamp(0.0, 1.0);
    
    String? expandedSemanticsValue = widget.semanticsValue;
    if (widget.value != null) {
      expandedSemanticsValue ??= '${(widget.value! * 100).round()}%';
    }

    // Build Semantics Wrapper
    return Semantics(
      label: widget.semanticsLabel,
      value: expandedSemanticsValue,
      child: Container(
        width: _indicatorSize,
        height: _indicatorSize,
        margin: const EdgeInsets.all(4.0), // accommodate the shadow
        child: Material(
          type: MaterialType.circle,
          color: widget.backgroundColor ?? Theme.of(context).canvasColor,
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomPaint(
              painter: _ColoredRefreshProgressIndicatorPainter(
                value: null, // Draw the indeterminate progress indicator.
                valueColor: _tweenSequence.evaluate(_colorController),
                headValue: headValue,
                tailValue: tailValue,
                offsetValue: offsetValue,
                rotationValue: rotationValue,
                strokeWidth: widget.strokeWidth,
                arrowheadScale: arrowheadScale,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimation() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return _buildIndicator(
          context,
          _strokeHeadTween.evaluate(_controller),
          _strokeTailTween.evaluate(_controller),
          _offsetTween.evaluate(_controller),
          _rotationTween.evaluate(_controller),
        );
      },
    );
  }

  // Always show the indeterminate version of the circular progress indicator.
  // When value is non-null the sweep of the progress indicator arrow's arc
  // varies from 0 to about 270 degrees. When value is null the arrow animates
  // starting from wherever we left it.
  @override
  Widget build(BuildContext context) {
    if (widget.value != null)
      _controller.value = widget.value! * (1333 / 2 / _kIndeterminateCircularDuration);
    else if (!_controller.isAnimating) {
      _controller.repeat();
      _colorController.repeat();
    }
    return _buildAnimation();
  }
}