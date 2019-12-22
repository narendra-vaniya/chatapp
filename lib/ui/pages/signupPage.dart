import 'package:chatapp/api/reuseWidget.dart';
import 'package:chatapp/ui/widgets/signupForm.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //!Upper part of sign up page
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Reuse.getColor(),
                      borderRadius: BorderRadius.only(bottomLeft:Radius.circular(70))
                  ),
                  child:Container(
                   //color: Colors.red,
                    child:  FittedBox(
                    child: Image.asset('images/logo.png')
                  ),
                  )
                ),
              ),
             //!Bottom part of sign up page (Form)
              Expanded(
                flex: 6,
                child: Container(
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