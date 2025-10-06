# screenshotbase (Dart)

Dart client for the Screenshotbase API.

- Website: https://screenshotbase.com
- Docs: https://screenshotbase.com/docs/

## Install

Add to your `pubspec.yaml`:

```yaml
dependencies:
  screenshotbase: ^0.1.0
```

## Usage

```dart
import 'package:screenshotbase/screenshotbase.dart';

void main() async {
  final client = ScreenshotbaseClient('YOUR_API_KEY');
  final result = await client.capture({
    'url': 'https://example.com',
    'width': 1280,
    'height': 800,
  });
  print(result);
}
```
