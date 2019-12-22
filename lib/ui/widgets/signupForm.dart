import 'package:chatapp/api/reuseWidget.dart';
import 'package:chatapp/api/screeninfo.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _screen = ScreenInfo(context);
    return Form(
      key: _formkey,
      child: Container(
        margin: EdgeInsets.all(_screen.getWidth * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //!Email Textbox
            Container(
              child: TextFormField(
                decoration: Reuse.textBoxStyle(" Enter email", context),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(
              height: _screen.getHeight * 0.02,
            ),
            //!Password TextBox
            Container(
              child: TextFormField(
                decoration: Reuse.textBoxStyle(" Enter password", context),
              ),
            ),
            SizedBox(
              height: _screen.getHeight * 0.03,
            ),
            //!Sign up Button
            Container(
              width: double.infinity,
              height:  (_screen.getHeight*0.055<45)?_screen.getHeight*0.055:null,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: RaisedButton(
                  child: FittedBox(
                    child: Text(
                      "Sign up",
                      style: Reuse.getButtonTextStyle(),
                    ),
                    fit: BoxFit.fill,
                  ),
                  color: Reuse.getColor(),
                  shape: Reuse.getButtonStyle(),
                  onPressed: () {},
                ),),
                SizedBox(height: 10,),
            //!Login with Google button
            Container(
              width: double.infinity,
              height: (_screen.getHeight*0.055<45)?_screen.getHeight*0.055:null,
              
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: RaisedButton(
                child: FittedBox(
                  child: Text(
                    "Continue with Google",
                    style: Reuse.getButtonTextStyle(),
                  ),
                  fit: BoxFit.fill,
                ),
                color: Colors.redAccent,
                shape: Reuse.getButtonStyle(),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: _screen.getHeight * 0.05,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: _screen.getHeight * 0.03,
                //color: Colors.red,
                child: FlatButton(
                  child: FittedBox(
                    child: Text("Already member? Sign in"),
                  ),
                  onPressed: () {
                     Navigator.pushNamed(context, '/SignIn');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
