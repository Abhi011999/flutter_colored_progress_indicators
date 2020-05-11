import 'dart:ui';
import 'package:flutter/animation.dart';

import 'colors.dart';

const double _kCircularProgressWeight1 = 12.0;
const double _kCircularProgressWeight2 = 8.0;
const double _kLinearProgressWeight1 = 15.0;
const double _kLinearProgressWeight2 = 5.0;

TweenSequenceItem<Color> _tweenSequenceItem(double w, Color c1, Color c2) {
  return TweenSequenceItem(
    weight: w,
    tween: ColorTween(
      begin: c1,
      end: c2,
    ),
  );
}

final Animatable<Color> kCircularTweenSequence = TweenSequence<Color>([
  _tweenSequenceItem(_kCircularProgressWeight1, kColor1, kColor1),
  _tweenSequenceItem(_kCircularProgressWeight2, kColor1, kColor2),
  _tweenSequenceItem(_kCircularProgressWeight1, kColor2, kColor2),
  _tweenSequenceItem(_kCircularProgressWeight2, kColor2, kColor3),
  _tweenSequenceItem(_kCircularProgressWeight1, kColor3, kColor3),
  _tweenSequenceItem(_kCircularProgressWeight2, kColor3, kColor4),
  _tweenSequenceItem(_kCircularProgressWeight1, kColor4, kColor4),
  _tweenSequenceItem(_kCircularProgressWeight2, kColor4, kColor5),
  _tweenSequenceItem(_kCircularProgressWeight1, kColor5, kColor5),
  _tweenSequenceItem(_kCircularProgressWeight2, kColor5, kColor1),
]);

final Animatable<Color> kLinearTweenSequence = TweenSequence<Color>([
  _tweenSequenceItem(_kLinearProgressWeight1, kColor1, kColor1),
  _tweenSequenceItem(_kLinearProgressWeight2, kColor1, kColor2),
  _tweenSequenceItem(_kLinearProgressWeight1, kColor2, kColor2),
  _tweenSequenceItem(_kLinearProgressWeight2, kColor2, kColor3),
  _tweenSequenceItem(_kLinearProgressWeight1, kColor3, kColor3),
  _tweenSequenceItem(_kLinearProgressWeight2, kColor3, kColor4),
  _tweenSequenceItem(_kLinearProgressWeight1, kColor4, kColor4),
  _tweenSequenceItem(_kLinearProgressWeight2, kColor4, kColor5),
  _tweenSequenceItem(_kLinearProgressWeight1, kColor5, kColor5),
  _tweenSequenceItem(_kLinearProgressWeight2, kColor5, kColor1),
]);
