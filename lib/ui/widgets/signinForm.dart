import 'package:chatapp/api/auth.dart';
import 'package:chatapp/api/reuseWidget.dart';
import 'package:chatapp/api/screeninfo.dart';
import 'package:chatapp/ui/widgets/loadingbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formkey = GlobalKey<FormState>();
  String _email;
  String _pwd;
  
  @override
  Widget build(BuildContext context) {
    final _screen = ScreenInfo(context);
    ScreenUtil.init(context,
        width: _screen.getWidth,
        height: _screen.getHeight,
        allowFontScaling: true);
    ScreenUtil().setSp(24, allowFontScalingSelf: true);
    return Form(
      key: _formkey,
      child: Container(
        margin: EdgeInsets.all(_screen.getWidth * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: _screen.getHeight * 0.05,
            ),
            //!Email Textbox
            Container(
              child: TextFormField(
                decoration: reuse.textBoxStyle(" Enter email", context),
                keyboardType: TextInputType.emailAddress,
                onSaved: (email)=>_email=email,
                validator: (value){
                  return (value.isEmpty)?'Enter email':null;
                }
              ),
            ),
            SizedBox(
              height: _screen.getHeight * 0.025,
            ),
            //!Password TextBox
            Container(
              child: TextFormField(
                decoration: reuse.textBoxStyle(" Enter password", context),
                onSaved: (pwd)=>_pwd=pwd,
                validator: (value){
                  return (value.isEmpty)?'Enter password':null;
                },
              ),
            ),
            SizedBox(
              height: _screen.getHeight * 0.035,
            ),
            //!Sign in Button
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: RaisedButton(
                child: FittedBox(
                  child: Text(
                    "Sign in",
                    style: reuse.getButtonTextStyle(),
                  ),
                  fit: BoxFit.fill,
                ),
                color: Theme.of(context).canvasColor,
                shape: reuse.getButtonStyle(),
                onPressed: () async{
                  if(_formkey.currentState.validate()){
                      _formkey.currentState.save();
                      showLoading(context, "Sign in your account");
                      //Firebase signin
                      AuthResult _result = await authApi.signin(context, _email, _pwd);

                      (_result!=null)
                          ?Navigator.pushNamedAndRemoveUntil(context, '/MainPage', (Route r) => false)
                          :null;
                  }
                },
              ),
            ),
            SizedBox(
              height: _screen.getHeight * 0.1,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: _screen.getHeight * 0.029,
                child: FlatButton(
                  child: FittedBox(
                    child: Text("Not a member? Sign up"),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/SignUp', (Route r) => false);
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
