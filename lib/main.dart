import 'package:chatapp/api/reuseWidget.dart';
import 'package:chatapp/ui/pages/allchatListPage.dart';
import 'package:chatapp/ui/pages/allcontactsPage.dart';
import 'package:chatapp/ui/pages/mainPage.dart';
import 'package:chatapp/ui/pages/signinPage.dart';
import 'package:chatapp/ui/pages/signupPage.dart';
import 'package:chatapp/ui/pages/userAccountEditPage.dart';
import 'package:chatapp/ui/pages/userAccountPage.dart';
import 'package:flutter/material.dart';

void main()=> runApp(ChatApp());


class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:reuse.getThemeData(context),
     routes: _routes(context),
     initialRoute: '/',
    );
  }
}

_routes(context){
  return {
      '/':(context)=>SignUpPage(),
      '/SignUp':(context)=>SignUpPage(),
      '/SignIn':(context)=>SignInPage(),
      '/MainPage':(context)=>MainPage(),
      '/UserAccountEditPage':(context)=>UserAccountEditPage(),
      '/UserProfile':(context)=>UserAccountPage(),
      '/UserProfileEdit':(context)=>UserAccountEditPage(),
      '/AllContact':(context)=>AllContactsPage(),
      
  };
}