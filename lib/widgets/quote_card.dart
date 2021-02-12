import 'package:flutter/material.dart';
import 'package:quotes_app/utils/fetch_quote.dart';
import 'package:quotes_app/classes/quote.dart';

class QuoteCard extends StatefulWidget {
  @override
  _QuoteCardState createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  Future<Quote> futureQuote;

  @override
  void initState() {
    super.initState();

    futureQuote = fetchQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FutureBuilder<Quote>(
              future: futureQuote,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListTile(
                    title: Text(snapshot.data.text),
                    subtitle: Text(snapshot.data.author),
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return Icon(Icons.error);
                }

                return LinearProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
