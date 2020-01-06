import 'package:chatapp/api/auth.dart';
import 'package:chatapp/api/reuseWidget.dart';
import 'package:chatapp/api/screeninfo.dart';
import 'package:chatapp/ui/widgets/loadingbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/model/userdata.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  //!Variable
  final _formkey = GlobalKey<FormState>();
  String _email, _pwd;
  String _profile="https://firebasestorage.googleapis.com/v0/b/mychatapp-2410.appspot.com/o/download.png?alt=media&token=969f1015-a600-41fb-92ea-358ced933008";

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
            SizedBox(
              height: _screen.getHeight * 0.04,
            ),
            //!Email Textbox
            Container(
              child: TextFormField(
                decoration: reuse.textBoxStyle(" Enter email", context),
                keyboardType: TextInputType.emailAddress,
                validator: (val) {
                  return (val.isEmpty) ? 'Enter email' : null;
                },
                onSaved: (val) => _email = val,
              ),
            ),
            SizedBox(
              height: _screen.getHeight * 0.02,
            ),
            //!Password TextBox
            Container(
              child: TextFormField(
                decoration: reuse.textBoxStyle(" Enter password", context),
                validator: (val) {
                  return (val.isEmpty) ? 'Enter password' : null;
                },
                onSaved: (val) => _pwd = val,
              ),
            ),
            SizedBox(
              height: _screen.getHeight * 0.03,
            ),
            //!Sign up Button
            Container(
              width: double.infinity,
              height: (_screen.getHeight * 0.04 < 45)
                  ? _screen.getHeight * 0.055
                  : null,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: RaisedButton(
                child: FittedBox(
                  child: Text(
                    "Sign up",
                    style: reuse.getButtonTextStyle(),
                  ),
                  fit: BoxFit.fill,
                ),
                color: Theme.of(context).canvasColor,
                shape: reuse.getButtonStyle(),
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                    _formkey.currentState.save();
                    showLoading(context, "Creating your account..");
                    //name,email,pwd,about,profile
                    AuthResult _result = await authApi.signup(context,
                          User("",_email,_pwd,"",_profile),
                        );
                    (_result != null)
                        ?(_result.additionalUserInfo.isNewUser)
                            ? Navigator.pushNamedAndRemoveUntil(context, '/UserProfileEdit', (Route r) => false)
                            : Navigator.pushNamedAndRemoveUntil(context, '/MainPage', (Route r) => false)
                        : null;
                  }
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //!Login with Google button
            Container(
              width: double.infinity,
              height: (_screen.getHeight * 0.04 < 45)
                  ? _screen.getHeight * 0.055
                  : null,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: RaisedButton(
                child: FittedBox(
                  child: Text(
                    "Continue with Google",
                    style: reuse.getButtonTextStyle(),
                  ),
                  fit: BoxFit.fill,
                ),
                color: Colors.redAccent,
                shape: reuse.getButtonStyle(),
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
