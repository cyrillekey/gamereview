import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alerts {
  static showProgressDialog(BuildContext context, String title) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Flex(direction: Axis.horizontal, children: [
              const CircularProgressIndicator(),
              const Padding(padding: EdgeInsets.only(left: 15)),
              Flexible(
                  child: Text(
                title,
                style: TextStyle(color: Colors.black),
              ))
            ]),
          );
        });
  }

  static show(BuildContext context, String title, String message) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: Text(message),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Ok"))
            ],
          );
        });
  }

  static showSnackBar(BuildContext context, String message,
      {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: Text(message),
      backgroundColor: isError ? Colors.red : Colors.green,
    ));
  }
}
