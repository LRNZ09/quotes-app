import 'package:flutter/material.dart';
import 'package:quotes_app/fetch-quote.dart';
import 'package:quotes_app/quote.dart';

class QuoteCard extends StatefulWidget {
  @override
  _QuoteCardState createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  late Future<Quote> futureQuote;

  @override
  void initState() {
    super.initState();

    futureQuote = fetchQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FutureBuilder<Quote>(
            future: futureQuote,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListTile(
                  title: Text(snapshot.data!.text),
                  subtitle: Text(snapshot.data!.author),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return LinearProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
