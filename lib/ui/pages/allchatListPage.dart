import 'package:chatapp/api/reuseWidget.dart';
import 'package:chatapp/ui/widgets/allChatList.dart';
import 'package:flutter/material.dart';


class AllChatListPage extends StatefulWidget {
  @override
  _AllChatListPageState createState() => _AllChatListPageState();
}

class _AllChatListPageState extends State<AllChatListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("Chat",style: Reuse.getAppbarTextStyle(),),
        centerTitle: true,
      ),
      body:AllChatList()
    );
  }
}
