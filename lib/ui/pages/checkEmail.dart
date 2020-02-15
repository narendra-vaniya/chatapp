import 'package:chatapp/api/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chatapp/api/screeninfo.dart';

class CheckEmail extends StatefulWidget {
  @override
  _CheckEmailState createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {
  @override
  Widget build(BuildContext context) {
    final _screen = ScreenInfo(context);
    ScreenUtil.init(context, width: _screen.getWidth, height:_screen.getHeight, allowFontScaling: true);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "We sent mail to your account please verify your email address.",
                style: TextStyle(fontSize: ScreenUtil().setSp(15)),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: _screen.getHeight * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Resend verification mail
                  FlatButton.icon(
                    onPressed: () async {
                      FirebaseUser _user = await authApi.loginState();
                      await _user.sendEmailVerification();
                    },
                    icon: Icon(Icons.repeat),
                    label: Text("Resend"),
                  ),
                  //Recheck verification
                  FlatButton.icon(
                    onPressed: () async {
                      FirebaseUser _user = await authApi.loginState();
                      print(_user.isEmailVerified);
                      await _user.reload();
                       _user = await authApi.loginState();
                      (_user.isEmailVerified)
                          ? Navigator.pushNamedAndRemoveUntil(
                              context, '/UserInit', (Route) => false)
                          : showShankBarForError(context);
                    },
                    icon: Icon(Icons.refresh),
                    label: Text("Recheck"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

showShankBarForError(context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      elevation: 2,
      content: Text("Email is not verified."),
    ),
  );
}
