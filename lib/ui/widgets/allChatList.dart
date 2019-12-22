import 'package:chatapp/main.dart';
import 'package:chatapp/ui/pages/messagePage.dart';
import 'package:flutter/material.dart';

class AllChatList extends StatefulWidget {
  @override
  _AllChatListState createState() => _AllChatListState();
}

class _AllChatListState extends State<AllChatList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            elevation: 0,
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=>MessagePage()
                  ),);
              },
              contentPadding: EdgeInsets.all(5),
              leading: Image.asset('images/user.JPG'),
              title: Text("Meet"),
            ),
          );
        },
      ),
    );
  }
}
