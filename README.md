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

## Examples

### Render PDF with margins

```dart
final pdf = await client.capture({
  'url': 'https://example.com/invoice/123',
  'format': 'pdf',
  'pdfBackground': true,
  'margin': {
    'top': '20px', 'right': '20px', 'bottom': '20px', 'left': '20px'
  }
});
```

### Wait for selector (single-page apps)

```dart
final ready = await client.capture({
  'url': 'https://app.example.com/dashboard',
  'waitFor': {'selector': '#dashboard-loaded'},
  'deviceScaleFactor': 2
});
```

### Full-page with transparent background

```dart
final full = await client.capture({
  'url': 'https://example.com',
  'fullPage': true,
  'omitBackground': true
});
```

### Authenticated pages via headers

```dart
final authed = await client.capture({
  'url': 'https://example.com/private',
  'headers': {'Authorization': 'Bearer <TOKEN>'}
});
```

### Capture from raw HTML (no public URL)

```dart
const html = '<!doctype html><html><body><h1>Hello</h1></body></html>';
final fromHtml = await client.capture({
  'html': html,
  'width': 800,
  'height': 400
});
```

### Save returned image URL to file

```dart
import 'dart:io';
import 'package:http/http.dart' as http;

final resp = await client.capture({'url': 'https://example.com'});
final url = resp['url'] as String?;
if (url != null) {
  final bytes = await http.readBytes(Uri.parse(url));
  await File('/tmp/screenshot.png').writeAsBytes(bytes);
}
```
