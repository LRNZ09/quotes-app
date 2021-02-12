import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddJournalButton extends StatefulWidget {
  @override
  _AddJournalButtonState createState() => _AddJournalButtonState();
}

class _AddJournalButtonState extends State<AddJournalButton> {
  void handleOnPressed() async {
    FirebaseFirestore.instance
        .collection('journals')
        .add({'mood': 'neutral', 'text': 'bar', 'title': 'foo'});
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: handleOnPressed,
      tooltip: 'Add quote',
      child: Icon(Icons.add),
    );
  }
}
