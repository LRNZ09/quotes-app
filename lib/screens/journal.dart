import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class JournalScreen extends StatefulWidget {
  JournalScreen({Key key, this.id, this.mood, this.text, this.title})
      : super(key: key);

  final String id;
  final String mood;
  final String title;
  final String text;

  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  String mood;
  var text = '';
  var title = '';

  @override
  void initState() {
    super.initState();

    mood = widget.mood;
    text = widget.text;
    title = widget.title;
  }

  void handleOnAddPressed() async {
    var journals = FirebaseFirestore.instance.collection('journals');
    try {
      if (widget.id?.isNotEmpty ?? false)
        await journals.doc(widget.id).update({
          'date': DateTime.now(),
          'mood': mood,
          'text': text,
          'title': title,
        });
      else
        await journals.add({
          'date': DateTime.now(),
          'mood': mood,
          'text': text,
          'title': title,
          'userId': FirebaseAuth.instance.currentUser.uid
        });
    } catch (error) {
      print(error);
    } finally {
      Navigator.pop(context);
    }
  }

  void handleOnMoodChanged(newValue) {
    setState(() {
      mood = newValue;
    });
  }

  void handleOnTitleChanged(text) {
    setState(() {
      title = text;
    });
  }

  void handleOnTextChanged(text) {
    setState(() {
      this.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            (widget.id?.isNotEmpty ?? false) ? 'Edit journal' : 'Add journal'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          DropdownButton<String>(
            hint: Text('Mood'),
            value: mood,
            items: <String>['neutral', 'happy', 'sad']
                .map<DropdownMenuItem<String>>((String value) {
              var displayValue =
                  '${value[0].toUpperCase()}${value.substring(1)}';
              return DropdownMenuItem<String>(
                value: value,
                child: Text(displayValue),
              );
            }).toList(),
            onChanged: handleOnMoodChanged,
          ),
          SizedBox(height: 8),
          TextFormField(
            initialValue: widget.title,
            decoration: InputDecoration(
              labelText: 'Title',
            ),
            onChanged: handleOnTitleChanged,
          ),
          SizedBox(height: 8),
          TextFormField(
            initialValue: widget.text,
            decoration: InputDecoration(
              labelText: 'Text',
            ),
            onChanged: handleOnTextChanged,
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: ((mood?.isNotEmpty ?? false) &&
                    text.isNotEmpty &&
                    title.isNotEmpty)
                ? handleOnAddPressed
                : null,
            icon:
                Icon((widget.id?.isNotEmpty ?? false) ? Icons.edit : Icons.add),
            label: Text((widget.id?.isNotEmpty ?? false) ? 'Update' : 'Add'),
          ),
        ],
      ),
    );
  }
}
