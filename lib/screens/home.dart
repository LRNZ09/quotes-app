import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quotes_app/widgets/add_journal_button.dart';
import 'package:quotes_app/widgets/journal_list.dart';
import 'package:quotes_app/screens/login.dart';
import 'package:quotes_app/widgets/quote_card.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User user;

  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.authStateChanges().listen((User user) {
      setState(() {
        this.user = user;
      });
    });
  }

  void handleOnLoginPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void handleOnLogoutPressed() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          user == null
              ? IconButton(
                  icon: Icon(Icons.login),
                  tooltip: 'Login',
                  onPressed: handleOnLoginPressed,
                )
              : IconButton(
                  icon: Icon(Icons.logout),
                  tooltip: 'Logout',
                  onPressed: handleOnLogoutPressed,
                ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          QuoteCard(),
          SizedBox(height: 8),
          Divider(),
          SizedBox(height: 8),
          user == null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Center(
                    child: Text(
                      'Create an account or login from the button at the top right to add your journals',
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : JournalList(),
        ],
      ),
      floatingActionButton: user == null ? null : AddJournalButton(),
    );
  }
}
