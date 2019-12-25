import 'package:chatapp/api/reuseWidget.dart';
import 'package:chatapp/ui/widgets/signupForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/api/screeninfo.dart';
class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screen = ScreenInfo(context);
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //!Upper part of sign up page
            Expanded(
              flex: 2,
              child: Container(
                width: _screen.getWidth * 0.6,
                padding: EdgeInsets.all(45),
                //width: double.infinity,
                child: FittedBox(
                  child: Text(
                    "Sign up",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            //!Bottom part of sign up page (Form)
            Expanded(
              flex: 6,
              child: Container(

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
                ),
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
