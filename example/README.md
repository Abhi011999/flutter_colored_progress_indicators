# example app

<p align="center"><img src="https://raw.githubusercontent.com/Abhi011999/flutter_colored_progress_indicators/master/images/example.gif" alt="example"/></p>

## Code

```dart
import 'package:flutter/material.dart';

import 'package:flutter_colored_progress_indicators/flutter_colored_progress_indicators.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ColoredProgressDemo(),
    );
  }
}

class ColoredProgressDemo extends StatefulWidget {
  @override
  _ColoredProgressDemoState createState() => _ColoredProgressDemoState();
}

class _ColoredProgressDemoState extends State<ColoredProgressDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Without animation"),
        SizedBox(height: 50.0),
        SizedBox(
          height: 100.0,
          width: 100.0,
          child: CircularProgressIndicator(strokeWidth: 8.0),
        ),
        SizedBox(height: 50.0),
        SizedBox(
          width: 400.0,
          child: LinearProgressIndicator(),
        ),
        SizedBox(height: 100.0),
        Text("With colorful accents"),
        SizedBox(height: 50.0),
        SizedBox(
          width: 100.0,
          height: 100.0,
          child: ColoredCircularProgressIndicator(strokeWidth: 8.0),
        ),
        SizedBox(height: 50.0),
        SizedBox(
          width: 400.0,
          child: ColoredLinearProgressIndicator(),
        ),
      ],
    );
  }
}

```