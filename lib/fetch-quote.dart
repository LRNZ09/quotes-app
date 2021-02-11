import 'dart:convert';
import 'dart:io';

import 'package:quotes_app/quote.dart';

Future<Quote> fetchQuote() async {
  final client = new HttpClient();
  final request =
      await client.getUrl(Uri.parse('https://zenquotes.io/api/today'));
  final response = await request.close();

  if (response.statusCode == 200) {
    final body = await response.transform(utf8.decoder).join();
    return Quote.fromJson(jsonDecode(body)[0]);
  } else {
    throw Exception('Failed to load quote');
  }
}
