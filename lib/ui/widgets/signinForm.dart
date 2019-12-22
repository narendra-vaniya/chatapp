import 'package:chatapp/api/reuseWidget.dart';
import 'package:chatapp/api/screeninfo.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
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
            //!Sign in Button
            Container(
              width: double.infinity,
              
              height: (_screen.getHeight*0.055<45)?_screen.getHeight*0.055:null,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: RaisedButton(
                  child: FittedBox(
                    child: Text(
                      "Sign in",
                      style: Reuse.getButtonTextStyle(),
                    ),
                    fit: BoxFit.fill,
                  ),
                  color: Reuse.getColor(),
                  shape: Reuse.getButtonStyle(),
                  onPressed: () {
                    Navigator.pushNamed(context, '/MainPage');
                  },
                )),
            SizedBox(height: _screen.getHeight*0.045,),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: _screen.getHeight * 0.029,
                //color: Colors.red,
                child: FlatButton(
                  child: FittedBox(
                    child: Text("Not a member? Sign up"),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/SignUp');
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
