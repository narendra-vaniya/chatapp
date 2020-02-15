import 'package:chatapp/api/databaseApi.dart';
import 'package:chatapp/api/imagepicker.dart';
import 'package:chatapp/api/reuseWidget.dart';
import 'package:chatapp/ui/pages/allcontactsPage.dart';
import 'package:chatapp/ui/pages/mainPage.dart';
import 'package:chatapp/ui/pages/settingPage.dart';
import 'package:chatapp/ui/pages/signinPage.dart';
import 'package:chatapp/ui/pages/signupPage.dart';
import 'package:chatapp/ui/pages/checkEmail.dart';
import 'package:chatapp/ui/pages/splashScreen.dart';
import 'package:chatapp/ui/pages/userAccountEditPage.dart';
import 'package:chatapp/ui/pages/userAccountPage.dart';
import 'package:chatapp/ui/pages/userinit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/api/auth.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ImagePic()),
        ChangeNotifierProvider(create: (context) => Database()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: reuse.getThemeData(context),
        routes: _routes(context),
        home: FutureBuilder(
          future: _user,
          builder: (context, AsyncSnapshot<FirebaseUser> user) {
            return (user.connectionState == ConnectionState.done)
                ? (user.hasData)
                    ? (user.data.isEmailVerified) ? MainPage() : CheckEmail()
                    : SignInPage()
                : SplashScreen();
          },
        ),
      ),
    );
  }
}

//All list of routes
_routes(context) {
  return {
    '/SplashScreen': (context) => SplashScreen(),
    '/SignUp': (context) => SignUpPage(),
    '/SignIn': (context) => SignInPage(),
    '/MainPage': (context) => MainPage(),
    '/CheckEmail': (context) => CheckEmail(),
    '/SettingPage': (context) => SettingPage(),
    '/UserAccountEditPage': (context) => UserAccountEditPage(),
    '/UserProfile': (context) => UserAccountPage(),
    '/UserInit': (context) => UserInit(),
    '/UserProfileEdit': (context) => UserAccountEditPage(),
    '/AllContact': (context) => AllContactsPage(),
  };
}
