import 'package:chatapp/api/reuseWidget.dart';
import 'package:chatapp/ui/widgets/signupForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/api/screeninfo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screen = ScreenInfo(context);
    ScreenUtil.init(context,
        width: _screen.getWidth,
        height: _screen.getHeight,
        allowFontScaling: true);
    ScreenUtil().setSp(24, allowFontScalingSelf: true);
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //!Upper part of sign up page
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(20), color: Colors.white),
                ),
              ),
            ),
            
            //!Bottom part of sign up page (Form)
            Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: SingleChildScrollView(
                  child: SignUpForm(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
