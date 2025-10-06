library screenshotbase;

import 'dart:convert';
import 'package:http/http.dart' as http;

class ScreenshotbaseClient {
  final String apiKey;
  final Uri baseUri;

  ScreenshotbaseClient(this.apiKey, {Uri? baseUri})
      : baseUri = baseUri ?? Uri.parse('https://api.screenshotbase.com');

  Future<Map<String, dynamic>> capture(Map<String, dynamic> options) async {
    final uri = baseUri.replace(path: baseUri.path + 'capture');
    final res = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'apikey': apiKey,
      },
      body: jsonEncode(options),
    );
    if (res.statusCode < 200 || res.statusCode >= 300) {
      throw Exception('Screenshotbase error: ${res.statusCode} ${res.body}');
    }
    return jsonDecode(res.body) as Map<String, dynamic>;
  }
}
