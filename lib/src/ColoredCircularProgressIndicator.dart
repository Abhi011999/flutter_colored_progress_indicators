// Copyright (c) 2020 Abhishek Dubey.
//
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'tweens.dart';

class ColoredCircularProgressIndicator extends ProgressIndicator {
  /// Creates a colored circular progress indicator.
  ///
  /// {@macro flutter.material.progressIndicator.parameters}
  const ColoredCircularProgressIndicator({
    Key key,
    double value,
    Color backgroundColor,
    this.strokeWidth = 4.0,
    String semanticsLabel,
    String semanticsValue,
  }) : super(
          key: key,
          value: value,
          backgroundColor: backgroundColor,
          semanticsLabel: semanticsLabel,
          semanticsValue: semanticsValue,
        );

  /// The width of the line used to draw the circle.
  final double strokeWidth;

  @override
  _ColoredCircularProgressIndicatorState createState() => _ColoredCircularProgressIndicatorState();
}

class _ColoredCircularProgressIndicatorState extends State<ColoredCircularProgressIndicator> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animatable<Color> _tweenSequence = kCircularTweenSequence;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CircularProgressIndicator(
            key: widget.key,
            value: widget.value,
            backgroundColor: widget.backgroundColor,
            valueColor: AlwaysStoppedAnimation<Color>(_tweenSequence.evaluate(AlwaysStoppedAnimation(_controller.value))),
            strokeWidth: widget.strokeWidth,
            semanticsLabel: widget.semanticsLabel,
            semanticsValue: widget.semanticsValue,
          );
        });
  }
}
