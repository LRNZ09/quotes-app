import 'package:flutter/material.dart';

class AddJournalButton extends StatefulWidget {
  @override
  _AddJournalButtonState createState() => _AddJournalButtonState();
}

class _AddJournalButtonState extends State<AddJournalButton> {
  void handleOnPressed() {}

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: handleOnPressed,
      tooltip: 'Add quote',
      child: Icon(Icons.add),
    );
  }
}
