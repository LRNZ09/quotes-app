import 'package:flutter/material.dart';
import 'package:quotes_app/screens/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Quotes App';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Home(title: title),
    );
  }
}
