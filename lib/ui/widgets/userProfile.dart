import 'package:chatapp/api/reuseWidget.dart';
import 'package:chatapp/api/screeninfo.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final _screen = ScreenInfo(context);
    return SingleChildScrollView(
      child: Container(
        //padding: EdgeInsets.all(10),
        child: Table(
          children: <TableRow>[
            //!Row one
            TableRow(
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  fit: StackFit.passthrough,
                  children: <Widget>[
                    Container(
                      child: FittedBox(
                        child: Image.asset('images/user.JPG'),
                        fit: BoxFit.fill,
                      ),
                      height: _screen.getHeight * 0.55,
                    ),
                    Container(
                      child: Text(
                        "Narendra vaniya",
                        style: TextStyle(
                            fontSize: _screen.getWidth * 0.09,
                            color: Colors.white,
                            fontWeight: FontWeight.w800),
                      ),
                    )
                  ],
                ),
              ],
            ),
            //!Second Row
            TableRow(
              children: [
                 ListTile(
                    leading: Icon(Icons.phone),
                    title: Text("+917818930644"),
                 ),
              ]
            ), 
            TableRow(
              children: [
                 ListTile(
                    leading: Icon(Icons.mail),
                    title: Text("nkvaniya2410@gmail.com"),
                 ),
              ]
            ), 
             TableRow(
              children: [
                 ListTile(
                    leading: Icon(Icons.business),
                    title: Text("I am flutter & firebase developer."),
                 ),
              ]
            ), 
          ],
        ),
      ),
    );
  }
}
