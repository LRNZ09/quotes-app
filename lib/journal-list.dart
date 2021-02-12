import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class JournalList extends StatelessWidget {
  var journalsStream =
      FirebaseFirestore.instance.collection('journals').snapshots();

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());

    // https://github.com/FirebaseExtended/flutterfire/issues/4948
    // return StreamBuilder<QuerySnapshot>(
    //   stream: journalsStream,
    //   builder: (_context, snapshot) {
    //     if (snapshot.hasError) {
    //       return Center(child: Icon(Icons.error));
    //     }

    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return CircularProgressIndicator();
    //     }

    //     return ListView(
    //       children: snapshot.data!.docs.map((DocumentSnapshot document) {
    //         var data = document.data();
    //         data!;

    //         return ListTile(
    //           title: Text(data['title']),
    //           subtitle: Text(data['text']),
    //         );
    //       }).toList(),
    //     );
    //   },
    // );
  }
}
