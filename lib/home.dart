import 'package:flutter/material.dart';
import 'package:quotes_app/add-journal-button.dart';
import 'package:quotes_app/quote-card.dart';

class Home extends StatefulWidget {
  Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.login),
            tooltip: 'Login',
            onPressed: () {
              // setState(() { });
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          QuoteCard(),
          SizedBox(height: 8),
          Divider(),
          SizedBox(height: 8),
        ],
      ),
      floatingActionButton: AddJournalButton(),
    );
  }
}
