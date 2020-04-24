import 'package:flutter/material.dart';

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
  Animation<int> _kStepTween;
  Color _colorValue = Colors.blueAccent[700];

  void _linearColorAnim() {
    _kStepTween = StepTween(
      begin: 0,
      end: 5,
    ).animate(_controller)
      ..addListener(() {
        setState(() {
          if (_kStepTween.value == 0 && _colorValue != Colors.blueAccent[700])
            _colorValue = Colors.blueAccent[700];
          if (_kStepTween.value == 1 && _colorValue != Colors.redAccent[700])
            _colorValue = Colors.redAccent[700];
          if (_kStepTween.value == 2 && _colorValue != Colors.yellowAccent[700])
            _colorValue = Colors.yellowAccent[700];
          if (_kStepTween.value == 3 && _colorValue != Colors.greenAccent[700])
            _colorValue = Colors.greenAccent[700];
          if (_kStepTween.value == 4 && _colorValue != Colors.purpleAccent[700])
            _colorValue = Colors.purpleAccent[700];
        });
      });
    _controller.repeat();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 9),
      vsync: this,
    );
    _linearColorAnim();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      key: widget.key,
      value: widget.value,
      backgroundColor: widget.backgroundColor,
      valueColor: AlwaysStoppedAnimation<Color>(_colorValue),
      semanticsLabel: widget.semanticsLabel,
      semanticsValue: widget.semanticsValue,
    );
  }
}