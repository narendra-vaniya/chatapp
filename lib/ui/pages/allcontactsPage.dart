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
      appBar: AppBar(
        leading: Container(),
        title: Text(
          "Suggested for you",
          style: reuse.getAppbarTextStyle(),
        ),
        centerTitle: true,
      ),
      body: AllContacts(),
    );
  }
}
