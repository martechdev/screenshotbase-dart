import 'package:screenshotbase/screenshotbase.dart';

void main() async {
  final client = ScreenshotbaseClient('YOUR_API_KEY');
  final result = await client.capture({'url': 'https://example.com'});
  print(result);
}
