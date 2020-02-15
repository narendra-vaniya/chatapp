/*
   This page is contain Setting like profile,find friends and delete account.
 */

import 'package:chatapp/api/databaseApi.dart';
import 'package:chatapp/api/reuseWidget.dart';
import 'package:chatapp/api/screeninfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final _screen = ScreenInfo(context);
    return Container(
        width: _screen.getWidth,
        height: _screen.getHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        child: settingComponetDesign(context));
  }
}

//Design of setting Page
settingComponetDesign(context) {
  final _screen = ScreenInfo(context);
  return ListView(
    children: <Widget>[
      //Appbar
      AppBar(
        leading: Container(),
        elevation: 0,
        backgroundColor: reuse.getAppbarColor(),
        title: Text(
          "Settings",
          style: reuse.getAppbarTextStyle(),
        ),
      ),
      //User name and image
      StreamBuilder(
        stream: DB.getCurrentUserData(),
        builder: (context, user) {
          return (user.connectionState == ConnectionState.active)
              ? (user.hasData)
                  ? Card(
                      elevation: 0,
                      child: ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, '/UserProfile');
                        },
                        leading: ClipRRect(
                            borderRadius: BorderRadius.circular(1000),
                            child: Image.network(
                                user.data.documents[0]['profile'],fit: BoxFit.cover,width: 60,height: 60,)),
                        title: Text("${user.data.documents[0]['name'] ??'asd'}"),
                        subtitle: Text("${user.data.documents[0]['about']??''}"),
                      ),
                    )
                  : null
              : Center(child: LinearProgressIndicator(),);
        },
      ),
      //Divider
      Divider(
        height: 1,
        color: Theme.of(context).canvasColor,
      ),

      //!Find friends row
      Card(
        elevation: 0,
        child: ListTile(
          onTap: () {
            DB.getAllContactList();
            Navigator.pushNamed(context, '/AllContact');
          },
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(500),
            child: Image.asset('images/find_fri.png'),
          ),
          title: Text(
            "Find your friends",
            style: reuse.getSmallTextStyle(context),
          ),
          subtitle: Text("Send a request and chat"),
        ),
      ),
      //Divider
      Divider(
        color: Theme.of(context).canvasColor,
        height: 0,
        indent: 85,
      ),
      //!Delete account
      ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(500),
          child: Image.asset('images/delete_acc.png'),
        ),
        title: Text("Delete my account"),
        subtitle: Text("After deleteing, you lose your data"),
      ),
      //!Divider
      Divider(
        color: Theme.of(context).canvasColor,
        height: 0,
        indent: 85,
      ),
    ],
  );
}
