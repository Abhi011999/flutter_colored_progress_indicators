# flutter_colored_progress_indicators <span> | </span> <a href="https://pub.dev/packages/flutter_colored_progress_indicators"><img src="https://img.shields.io/badge/pub.dev-v1.0.1-red?style=flat-square" alt="flutter"/></a> <a href="https://flutter.dev/"><img src="https://img.shields.io/badge/Built with-flutter-blue?style=flat-square" alt="flutter"/></a>

<p align="center"><img src="https://raw.githubusercontent.com/Abhi011999/flutter_colored_progress_indicators/master/images/example_readme.gif" alt="example"/></p>

---

<p align="center"><img src="https://raw.githubusercontent.com/Abhi011999/flutter_colored_progress_indicators/master/images/example.gif" alt="example"/></p>

An alternate animated progress indicator widget for flutter's [CircularProgressIndicator](https://api.flutter.dev/flutter/material/CircularProgressIndicator-class.html), [LinearProgressIndicator](https://api.flutter.dev/flutter/material/LinearProgressIndicator-class.html) and [RefreshIndicator](https://api.flutter.dev/flutter/material/RefreshIndicator-class.html) with Google color accents.

## Features

- Colorful `CircularProgressIndicator`
- Colorful `LinearProgressIndicator`
- Colorful `RefreshIndicator`
yes that's it.

## Getting Started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  flutter_colored_progress_indicators: ^1.1.0
```

In your library add the following import:

```dart
import 'package:flutter_colored_progress_indicators/flutter_colored_progress_indicators.dart';
```

After that run `flutter pub get`

For help getting started with Flutter, view the online [documentation](https://flutter.io/).

## Usage

#### For Circular Progress Indicator -

```dart
...
child: ColoredCircularProgressIndicator()
...
```

#### For Linear Progress Indicator -

```dart
...
child: ColoredLinearProgressIndicator()
...
```

#### For Refresh Indicator -

```dart
...
child: ColoredRefreshIndicator(
  child: SingleChildScrollView(
    physics: AlwaysScrollableScrollPhysics(),
    child: ...
  )
)
...
```

## Properties

Same as that of Flutter's official [CircularProgressIndicator](https://api.flutter.dev/flutter/material/CircularProgressIndicator-class.html#instance-properties), [LinearProgressIndicator](https://api.flutter.dev/flutter/material/LinearProgressIndicator-class.html#instance-properties) and [RefreshIndicator](https://api.flutter.dev/flutter/material/RefreshIndicator-class.html#instance-properties) but without
the `valueColor`/`color` property (because it changes with the color animation).

## Changelog

See [CHANGELOG.md](https://github.com/Abhi011999/flutter_colored_progress_indicators/blob/master/CHANGELOG.md) for recent changes.

## TO-DO

- [ ] Shorter names for indicators
- [x] Default color accents (they are a bit dark now)
- [ ] Animation speed control factor
- [x] Refactoring

## Contributions

You can be of great help if you want to improve or add anything !

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## License

> Package licensed under the [MIT License](https://github.com/Abhi011999/flutter_colored_progress_indicators/blob/master/LICENSE).