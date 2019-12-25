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
        //padding: EdgeInsets.only(top: 0,bottom: 15,left: 10,right: 10),
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

settingComponetDesign(context) {
  final _screen = ScreenInfo(context);
  return ListView(
    children: <Widget>[
      AppBar(
        leading: Container(),
        elevation: 0,
        backgroundColor: reuse.getAppbarColor(),
        title: Text(
          "Settings",
          style: reuse.getAppbarTextStyle(),
        ),
      ),
      Card(
        elevation: 0,
        child: ListTile(
          onTap: () {},
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(500),
            child: Image.asset('images/user.JPG'),
          ),
          title: Text("Narendra vaniya",style:reuse.getSmallTextStyle(context),),
          subtitle: Text("Edit your profile"),
        ),
      ),

      Divider(
        height: 1,
        color: Theme.of(context).canvasColor,
      ),

      //!Find friends row
      Card(
        elevation: 0,
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(500),
            child: Icon(
              Icons.delete_outline,
              
            ),
          ),
          title: Text(
            "Find your friends",
            style:reuse.getSmallTextStyle(context),
          ),
          subtitle: Text("Send a request and chat"),
        ),
      ),

      Divider(
        color: Theme.of(context).canvasColor,
        height: 0,
        indent: 100,
      ),

      ListTile(
        leading: Icon(Icons.delete),
        title: Text("Delete my account"),
        subtitle: Text("After deleteing, you lose your data"),
      ),
      Divider(
        color: Theme.of(context).canvasColor,
        height: 0,
        indent: 100,
      ),
    ],
  );
}
