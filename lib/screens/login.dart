import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email = '';
  var password = '';

  void handleOnLoginPressed() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
        } catch (error) {
          print(error);
        }
      } else {
        print(error);
      }
    } catch (error) {
      print(error);
    } finally {
      Navigator.pop(context);
    }
  }

  void handleOnEmailChanged(text) {
    setState(() {
      email = text;
    });
  }

  void handleOnPasswordChanged(text) {
    setState(() {
      password = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome back'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
            ),
            onChanged: handleOnEmailChanged,
          ),
          SizedBox(height: 8),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
            onChanged: handleOnPasswordChanged,
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: handleOnLoginPressed,
            icon: Icon(Icons.login),
            label: Text('Login'),
          ),
          TextButton.icon(
            onPressed: () {
              // TODO
            },
            icon: Icon(Icons.help),
            label: Text('Forgot password'),
          )
        ],
      ),
    );
  }
}
