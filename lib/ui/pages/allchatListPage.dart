import 'package:chatapp/api/reuseWidget.dart';
import 'package:chatapp/ui/widgets/allChatList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllChatListPage extends StatefulWidget {
  @override
  _AllChatListPageState createState() => _AllChatListPageState();
}

class _AllChatListPageState extends State<AllChatListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: reuse.getAppbarColor(),
        elevation: 0,
        leading: Container(),
        centerTitle: false,

        title: Text(
          "Message",
          style: reuse.getAppbarTextStyle(),
        ),
      ),
      body: AllChatList(),
    );
  }
}
