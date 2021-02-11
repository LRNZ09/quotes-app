import 'package:flutter/material.dart';
import 'package:quotes_app/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Quotes App';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Home(title: title),
    );
  }
}
