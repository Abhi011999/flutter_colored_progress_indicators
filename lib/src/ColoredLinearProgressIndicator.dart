// Copyright (c) 2020 Abhishek Dubey.
//
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'tweens.dart';

class ColoredLinearProgressIndicator extends ProgressIndicator {
  /// Creates a colored linear progress indicator.
  ///
  /// {@macro flutter.material.progressIndicator.parameters}
  const ColoredLinearProgressIndicator({
    Key key,
    double value,
    Color backgroundColor,
    String semanticsLabel,
    String semanticsValue,
  }) : super(
          key: key,
          value: value,
          backgroundColor: backgroundColor,
          semanticsLabel: semanticsLabel,
          semanticsValue: semanticsValue,
        );

  @override
  _ColoredLinearProgressIndicatorState createState() => _ColoredLinearProgressIndicatorState();
}

class _ColoredLinearProgressIndicatorState extends State<ColoredLinearProgressIndicator> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animatable<Color> _tweenSequence = kLinearTweenSequence;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 9),
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
          return LinearProgressIndicator(
            key: widget.key,
            value: widget.value,
            backgroundColor: widget.backgroundColor,
            valueColor: AlwaysStoppedAnimation<Color>(_tweenSequence.evaluate(AlwaysStoppedAnimation(_controller.value))),
            semanticsLabel: widget.semanticsLabel,
            semanticsValue: widget.semanticsValue,
          );
        });
  }
}
