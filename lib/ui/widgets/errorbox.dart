import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showError(context, String error) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 2,
        title: Text(error),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            icon: Icon(Icons.cancel),
            label: Text("OK"),
          )
        ],
      );
    },
  );
}
