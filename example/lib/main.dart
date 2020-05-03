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
  Future<void> _refreshState() async {
    await Future.delayed(Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Scroll from top for Refresh Indicator"),
      ),
      body: ColoredRefreshIndicator(
        onRefresh: () => _refreshState(),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          physics: AlwaysScrollableScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Without Colorful Accents (default)",
                  textScaleFactor: 2.0,
                  textAlign: TextAlign.center,
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
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
                SizedBox(height: 80.0),
                Text(
                  "With Colorful Accents",
                  textScaleFactor: 2.0,
                  textAlign: TextAlign.center,
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
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
            ),
          ),
        ),
      ),
    );
  }
}
