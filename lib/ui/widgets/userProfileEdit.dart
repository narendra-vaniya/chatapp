import 'package:chatapp/api/reuseWidget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chatapp/api/screeninfo.dart';
import 'package:flutter/material.dart';

class UserProfileEdit extends StatefulWidget {
  @override
  _UserProfileEditState createState() => _UserProfileEditState();
}

class _UserProfileEditState extends State<UserProfileEdit> {
  @override
  Widget build(BuildContext context) {
    final _screen = ScreenInfo(context);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //SizedBox
            SizedBox(
              height: 20,
            ),
            //User image
            Container(
              child: Align(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: Image.asset(
                    'images/user.JPG',
                    width: 120,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //!User name
            TextFormField(
              decoration: reuse.textBoxStyle("Enter name", context),
            ),

            //!User email
            TextFormField(
              decoration: reuse.textBoxStyle("Enter name", context),
            ),
            //!User about
            ListOfComponet("ABOUT", "Hii Friends,I am Flutter and Firebase developer.", _screen),
            Divider(
              height: 5,
              color: Theme.of(context).canvasColor,
            ),
          ],
        ),
      ),
    );
  }
}

//Design of Componet

ListOfComponet(msg1, msg2, _screen) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 6,
        ),
        Container(
          width: _screen.getWidth,
          child: Text(msg1),
        ),
        SizedBox(
          height: 1,
        ),
        Container(
          child: Text(
            msg2,
            style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(20)),
          ),
        ),
        SizedBox(
          height: 6,
        ),
      ],
    ),
  );
}