import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showLoading(context, String msg) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(

        elevation: 3,
        child: ListTile(
          leading: CircularProgressIndicator(strokeWidth: 2,),
          title: Text(msg),

        )
      );
    },
  );
}
