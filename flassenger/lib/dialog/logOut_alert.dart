import 'package:firebase_auth/firebase_auth.dart';
import 'package:flassenger/screens/loading_screen.dart';
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
          height: 20,
        ),
        Container(
          width: 200,
          height: 50,
          margin: EdgeInsets.only(top: 20),
          child: Text(
            'Are you sure want to log out?',
          ),
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
          Navigator.pushNamed(
            context,
            LoadingScreen.id,
          );
          print('Log out successfully!');
        },
      ),
    ],
  ).show();
}
