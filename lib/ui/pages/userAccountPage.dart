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
        
        leading: Container(),
        title: Text(
          "Your profile",
          style: Reuse.getAppbarTextStyle(),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            tooltip: 'Edit profile',
            onPressed: () {
              Navigator.pushNamed(context,'/UserAccountEditPage');
            },
          )
        ],
      ),

      //!Main Body
      body: UserProfile(),
    );
  }
}
