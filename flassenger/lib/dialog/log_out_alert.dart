import 'package:firebase_auth/firebase_auth.dart';
import 'package:flassenger/screens/welcome_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

logOut_alert(context) {
  final _auth = FirebaseAuth.instance;

  Alert(
    context: context,
    title: "Log Out",
    style: const AlertStyle(
      titleStyle: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: 200,
          height: 50,
          child: Text(
            'Are you sure want to log out?',
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ),
    buttons: [
      DialogButton(
        child: Text(
          'Cancel',
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      DialogButton(
        child: Text(
          'Sure!',
        ),
        onPressed: () {
          _auth.signOut();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => WelcomeScreen(),
            ),
          );
          print('Log out successfully!');
        },
      ),
    ],
  ).show();
}
