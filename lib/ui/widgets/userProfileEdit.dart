import 'package:chatapp/api/reuseWidget.dart';
import 'package:chatapp/api/screeninfo.dart';
import 'package:flutter/material.dart';

class UserProfileEdit extends StatefulWidget {
  @override
  _UserProfileEditState createState() => _UserProfileEditState();
}

class _UserProfileEditState extends State<UserProfileEdit> {
  @override
  Widget build(BuildContext context) {
    final _screen = ScreenInfo(context);
    return Container(
      child: Form(
        child: Table(
          children: <TableRow>[
            //!Row one
            TableRow(
              children: [
                Stack(
                  alignment: Alignment.center,
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
                        child: IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ))
                  ],
                ),
              ],
            ),
            //!Second Row
            TableRow(
              children: [
                ListTile(
                  leading: Icon(Icons.phone),
                  title: TextFormField(
                    //decoration: Reuse.textBoxStyle("", context),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                ListTile(
                  leading: Icon(Icons.mail),
                  title:  TextFormField(
                   // decoration: Reuse.textBoxStyle("", context),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                ListTile(
                  leading: Icon(Icons.business),
                  title:  TextFormField(
                    maxLines: 2,
                    minLines: 1,
                    maxLength: 50,
                    //decoration: Reuse.textBoxStyle("", context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
