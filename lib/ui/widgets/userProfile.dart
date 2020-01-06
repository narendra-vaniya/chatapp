import 'package:chatapp/api/reuseWidget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chatapp/api/screeninfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _screen = ScreenInfo(context);
    ScreenUtil.instance =
        ScreenUtil(width: _screen.getWidth, height: _screen.getHeight)
          ..init(context);
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
            ListOfComponet("NAME", "Narendra vaniya", _screen),
            Divider(
              height: 5,
              color: Theme.of(context).canvasColor,
            ),
            //!User email
            ListOfComponet("EMAIL", "nkvaniya2410@gmail.com", _screen),
            Divider(
              height: 5,
              color: Theme.of(context).canvasColor,
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
