import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quotes_app/screens/journal.dart';

var moodIconMap = {
  'happy': Icons.sentiment_satisfied_alt,
  'neutral': Icons.sentiment_neutral,
  'sad': Icons.sentiment_very_dissatisfied,
};

class JournalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var journalsStream = FirebaseFirestore.instance
        .collection('journals')
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser.uid)
        .orderBy('date', descending: true)
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: journalsStream,
      builder: (_context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(child: Icon(Icons.error));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        var children = snapshot.data.docs.map((DocumentSnapshot document) {
          var data = document.data();

          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JournalScreen(
                    id: document.id,
                    mood: data['mood'],
                    text: data['text'],
                    title: data['title'],
                  ),
                ),
              );
            },
            isThreeLine: true,
            leading: Icon(moodIconMap[data['mood']]),
            title: Text(data['title']),
            subtitle: Text(DateFormat.yMMMMd().format(data['date'].toDate())),
          );
        }).toList();

        return Column(
          children: children,
        );
      },
    );
  }
}
