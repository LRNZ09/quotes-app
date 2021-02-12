import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:quotes_app/classes/quote.dart';

Future<Quote> fetchQuote() async {
  final response = await http.get(Uri.parse('https://quotes.rest/qod'));

  if (response.statusCode == 200) {
    var quoteMap = jsonDecode(response.body);
    return Quote.fromJson(quoteMap["contents"]["quotes"][0]);
  } else {
    throw Exception('Failed to load quote');
  }
}
