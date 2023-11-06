import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

reminder_alert(context) {
  Alert(
    context: context,
    type: AlertType.warning,
    content: Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          height: 50,
          margin: EdgeInsets.only(top: 20),
          child: Text(
            'Please check your email address or password!',
          ),
        ),
      ],
    ),
    buttons: [
      DialogButton(
        color: Colors.lightBlueAccent,
        child: Text(
          'Sure!',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w200,
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ],
  ).show();
}
