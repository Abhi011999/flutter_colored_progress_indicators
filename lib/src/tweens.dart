import 'dart:ui';
import 'package:flutter/animation.dart';

import 'colors.dart';

const double _kCircularColorChangeDelay = 12.0;
const double _kCircularColorChangeDuration = 8.0;
const double _kLinearColorChangeDelay = 15.5;
const double _kLinearColorChangeDuration = 5.5;

TweenSequenceItem<Color> _tweenSequenceItem(double w, Color c1, Color c2) {
  return TweenSequenceItem(
    weight: w,
    tween: ColorTween(
      begin: c1,
      end: c2,
    ),
  );
}

final Animatable<Color> circularTweenSequence = TweenSequence<Color>([
  _tweenSequenceItem(_kCircularColorChangeDelay, kColor1, kColor1),
  _tweenSequenceItem(_kCircularColorChangeDuration, kColor1, kColor2),
  _tweenSequenceItem(_kCircularColorChangeDelay, kColor2, kColor2),
  _tweenSequenceItem(_kCircularColorChangeDuration, kColor2, kColor3),
  _tweenSequenceItem(_kCircularColorChangeDelay, kColor3, kColor3),
  _tweenSequenceItem(_kCircularColorChangeDuration, kColor3, kColor4),
  _tweenSequenceItem(_kCircularColorChangeDelay, kColor4, kColor4),
  _tweenSequenceItem(_kCircularColorChangeDuration, kColor4, kColor5),
  _tweenSequenceItem(_kCircularColorChangeDelay, kColor5, kColor5),
  _tweenSequenceItem(_kCircularColorChangeDuration, kColor5, kColor1),
]);

final Animatable<Color> linearTweenSequence = TweenSequence<Color>([
  _tweenSequenceItem(_kLinearColorChangeDelay, kColor1, kColor1),
  _tweenSequenceItem(_kLinearColorChangeDuration, kColor1, kColor2),
  _tweenSequenceItem(_kLinearColorChangeDelay, kColor2, kColor2),
  _tweenSequenceItem(_kLinearColorChangeDuration, kColor2, kColor3),
  _tweenSequenceItem(_kLinearColorChangeDelay, kColor3, kColor3),
  _tweenSequenceItem(_kLinearColorChangeDuration, kColor3, kColor4),
  _tweenSequenceItem(_kLinearColorChangeDelay, kColor4, kColor4),
  _tweenSequenceItem(_kLinearColorChangeDuration, kColor4, kColor5),
  _tweenSequenceItem(_kLinearColorChangeDelay, kColor5, kColor5),
  _tweenSequenceItem(_kLinearColorChangeDuration, kColor5, kColor1),
]);
