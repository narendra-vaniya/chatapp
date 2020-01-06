import 'package:chatapp/api/reuseWidget.dart';
import 'package:chatapp/ui/pages/allcontactsPage.dart';
import 'package:chatapp/ui/pages/mainPage.dart';
import 'package:chatapp/ui/pages/signinPage.dart';
import 'package:chatapp/ui/pages/signupPage.dart';
import 'package:chatapp/ui/pages/userAccountEditPage.dart';
import 'package:chatapp/ui/pages/userAccountPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/api/auth.dart';


//Main method
void main() => runApp(ChatApp());



class ChatApp extends StatefulWidget {
  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  Future<FirebaseUser> _user;
  @override
  void initState() {
    _user = authApi.loginState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: reuse.getThemeData(context),
      routes: _routes(context),
      home: FutureBuilder(
        future: _user,
        builder: (context, AsyncSnapshot<FirebaseUser> user) {
          return (user.connectionState == ConnectionState.done)
              ? (user.hasData) ? MainPage() : SignInPage()
              : SignInPage();
        },
      ),
    );
  }
}

//All list of routes
_routes(context) {
  return {
    //'/': (context) => SignUpPage(),
    '/SignUp': (context) => SignUpPage(),
    '/SignIn': (context) => SignInPage(),
    '/MainPage': (context) => MainPage(),
    '/UserAccountEditPage': (context) => UserAccountEditPage(),
    '/UserProfile': (context) => UserAccountPage(),
    '/UserProfileEdit': (context) => UserAccountEditPage(),
    '/AllContact': (context) => AllContactsPage(),
  };
}
