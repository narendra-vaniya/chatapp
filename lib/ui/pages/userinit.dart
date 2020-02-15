/*
    This file containt when user is new update infomation for init
 */

import 'package:flutter/material.dart';
import 'package:chatapp/ui/widgets/userProfileEdit.dart';
import 'package:chatapp/api/reuseWidget.dart';

class UserInit extends StatefulWidget {
  @override
  _UserInitState createState() => _UserInitState();
}

class _UserInitState extends State<UserInit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //!App bar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: reuse.getAppbarColor(),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/MainPage', (Route) => false);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).canvasColor,
          ),
        ),
        title: Text(
          "Edit profile",
          style: reuse.getAppbarTextStyle(),
        ),
      ),
      //!body
      body: UserProfileEdit(),
    );
  }
}
