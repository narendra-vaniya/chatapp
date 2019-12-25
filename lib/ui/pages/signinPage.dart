import 'package:chatapp/api/screeninfo.dart';
import 'package:chatapp/ui/widgets/signinForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screen = ScreenInfo(context);
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //!Upper part of sign up page
            Expanded(
              flex: 2,
              child: Container(
                width: _screen.getWidth * 0.6,
                padding: EdgeInsets.all(45),
                color: Theme.of(context).canvasColor,
                child: FittedBox(
                  child: Text(
                    "Sign in",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            //!Bottom part of sign up page (Form)
            Expanded(
              flex: 7,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: SignInForm(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
