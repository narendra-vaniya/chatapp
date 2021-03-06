import 'package:chatapp/ui/widgets/userProfileEdit.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/api/reuseWidget.dart';

class UserAccountEditPage extends StatefulWidget {
  @override
  _UserAccountEditPageState createState() => _UserAccountEditPageState();
}

class _UserAccountEditPageState extends State<UserAccountEditPage> {
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
          "Edit profile",
          style: reuse.getAppbarTextStyle(),
        ),
      ),
      //!body
      body: UserProfileEdit(),
    );
  }
}
