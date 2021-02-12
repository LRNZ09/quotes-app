import 'package:flutter/material.dart';
import 'package:quotes_app/screens/journal.dart';

class AddJournalButton extends StatefulWidget {
  @override
  _AddJournalButtonState createState() => _AddJournalButtonState();
}

class _AddJournalButtonState extends State<AddJournalButton> {
  void handleOnPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => JournalScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: handleOnPressed,
      tooltip: 'Add journal',
      child: Icon(Icons.add),
    );
  }
}
