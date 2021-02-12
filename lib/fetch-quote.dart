import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:quotes_app/quote.dart';

Future<Quote> fetchQuote() async {
  final response = await http.get(Uri.parse('https://zenquotes.io/api/today'));

  if (response.statusCode == 200) {
    var quoteMap = jsonDecode(response.body)[0];
    return Quote.fromJson(quoteMap);
  } else {
    throw Exception('Failed to load quote');
  }
}
