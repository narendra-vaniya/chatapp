import 'package:chatapp/api/screeninfo.dart';
import 'package:chatapp/ui/pages/allchatListPage.dart';
import 'package:chatapp/ui/pages/allcontactsPage.dart';
import 'package:chatapp/ui/pages/requestPage.dart';
import 'package:chatapp/ui/pages/settingPage.dart';
import 'package:chatapp/ui/pages/userAccountPage.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final _screen = ScreenInfo(context);
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        unselectedItemColor: Color.fromRGBO(131, 133, 161, 1),
        selectedItemColor: Colors.white,
        iconSize: _screen.getWidth * 0.09,
        elevation: 0,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.bubble_chart), title: Text("")),
          BottomNavigationBarItem(icon: Icon(Icons.people), title: Text("")),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("")),
        ],
      ),
      body: _changeWidget(index),
    );
  }
}

_changeWidget(index) {
  switch (index) {
    case 0:
      return AllChatListPage();
      break;
    case 1:
      return RequestPage();
      break;
    case 2:
      return SettingPage();
      break;

  }
}
