/*
  This page contain user() profile
 */
import 'package:chatapp/api/reuseWidget.dart';
import 'package:chatapp/ui/widgets/userProfile.dart';
import 'package:flutter/material.dart';

class UserAccountPage extends StatefulWidget {
  @override
  _UserAccountPageState createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //!App bar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: reuse.getAppbarColor(),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).canvasColor,
          ),
        ),
        title: Text(
          "My profile",
          style: reuse.getAppbarTextStyle(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            tooltip: 'Edit profile',
            onPressed: () {
              Navigator.pushNamed(context, '/UserAccountEditPage');
            },
          )
        ],
      ),

      //!Main Body
      body: UserProfile(),
    );
  }
}
