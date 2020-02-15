import 'package:chatapp/api/reuseWidget.dart';
import 'package:chatapp/ui/widgets/allContacts.dart';
import 'package:flutter/material.dart';

class AllContactsPage extends StatefulWidget {
  @override
  _AllContactsPageState createState() => _AllContactsPageState();
}

class _AllContactsPageState extends State<AllContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        leading:  IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Theme.of(context).canvasColor,),
            onPressed: () {
              Navigator.pop(context);
            },),
        elevation: 0,
        backgroundColor: reuse.getAppbarColor(),
        title: Text(
          "Make a friends",
          style: reuse.getAppbarTextStyle(),
        ),
      ),
      body: AllContacts(),
    );
  }
}
