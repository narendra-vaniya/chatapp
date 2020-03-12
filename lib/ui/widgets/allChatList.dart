import 'package:chatapp/api/reuseWidget.dart';
import 'package:chatapp/api/screeninfo.dart';
import 'package:chatapp/ui/pages/messagePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllChatList extends StatefulWidget {
  @override
  _AllChatListState createState() => _AllChatListState();
}

class _AllChatListState extends State<AllChatList> {
  @override
  Widget build(BuildContext context) {
    final _screen = ScreenInfo(context);
    return Container(
      padding: EdgeInsets.only(top: 0,bottom: 15,left: 10,right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      child: ListDesign(),
    );
  }
}

ListDesign() {
  return ListView.builder(
    itemCount: 3,
    itemBuilder: (context, index) {
      return Card(
        elevation: 0,
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MessagePage(index)),
            );
          },
          contentPadding: EdgeInsets.all(5),
          leading: ClipRRect(
            child:Icon(Icons.group)

          ),
          title: Text("Room ${index+1}",style:reuse.getUserTextStyle(),),
          subtitle: Text(""),
        ),
      );
    },
  );
}
