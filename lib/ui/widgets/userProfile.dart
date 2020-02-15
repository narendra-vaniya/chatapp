import 'package:chatapp/api/databaseApi.dart';
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
        ScreenUtil.init(context, width: _screen.getWidth, height:_screen.getHeight, allowFontScaling: true);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: StreamBuilder(
          stream: DB.getCurrentUserData(),
          builder: (context, userdata) {
            return (userdata.connectionState == ConnectionState.active)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //SizedBox
                      SizedBox(
                        height: 20,
                      ),
                      //User image
                      Container(
                       
                        child: Align(
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(1000),
                            child: Image.network(
                              userdata.data.documents[0]['profile'] ?? '',
                              width: 130,height: 130,
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, chk) {
                                return (chk == null)
                                    ? child
                                    : CircularProgressIndicator();
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //!User name
                      ListOfComponet(
                          "NAME",
                          "${userdata.data.documents[0]['name'] ?? ''}",
                          _screen),
                      Divider(
                        height: 5,
                        color: Theme.of(context).canvasColor,
                      ),
                      //!User email
                      ListOfComponet(
                          "EMAIL",
                          "${userdata.data.documents[0]['email'] ?? ''}",
                          _screen),
                      Divider(
                        height: 5,
                        color: Theme.of(context).canvasColor,
                      ),
                      //!User about
                      ListOfComponet(
                          "ABOUT",
                          "${userdata.data.documents[0]['about'] ?? ''}",
                          _screen),
                      Divider(
                        height: 5,
                        color: Theme.of(context).canvasColor,
                      ),
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
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
            style: TextStyle(fontSize: ScreenUtil().setSp(20)),
          ),
        ),
        SizedBox(
          height: 6,
        ),
      ],
    ),
  );
}
