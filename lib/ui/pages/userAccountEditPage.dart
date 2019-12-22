import 'package:chatapp/ui/widgets/userProfileEdit.dart';
import 'package:flutter/material.dart';

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
        
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {},
          )
        ],
      ),
      //!body
      body: SingleChildScrollView(
        child:  UserProfileEdit(),
      )
    );
  }
}
