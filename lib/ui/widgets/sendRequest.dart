import 'package:chatapp/api/reuseWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SendRequests extends StatefulWidget {
  @override
  _SendRequestsState createState() => _SendRequestsState();
}

class _SendRequestsState extends State<SendRequests> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20))),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      //!List view Builder
      child: ListView.builder(
        //itemExtent: 4,
        itemCount: 1,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.all(5),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child:Icon(Icons.account_circle)
            ),
            title: Text("Your name"),
            trailing: FittedBox(
              child: Chip(
                label: Text(
                  "Pending",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
