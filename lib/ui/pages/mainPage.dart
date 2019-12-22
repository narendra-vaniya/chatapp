import 'package:chatapp/api/reuseWidget.dart';
import 'package:chatapp/api/screeninfo.dart';
import 'package:chatapp/ui/pages/allchatListPage.dart';
import 'package:chatapp/ui/pages/allcontactsPage.dart';
import 'package:chatapp/ui/pages/requestPage.dart';
import 'package:chatapp/ui/pages/userAccountPage.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index=0;
  @override
  Widget build(BuildContext context) {
    final _screen = ScreenInfo(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        
        currentIndex: index,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Reuse.getColor(),
        backgroundColor: Colors.red,
        iconSize: _screen.getWidth*0.07,
        elevation: 1,
        type: BottomNavigationBarType.shifting,
        onTap: (value){
          setState(() {
            index=value;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text("Chat")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            title: Text("Request")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text("Contact")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text("Account")
          ),
          
          
        ],
      ),
      body: _changeWidget(index),
    );
  }
}

_changeWidget(index){

  switch(index){
    case 0:
      return AllChatListPage();
      break;
    case 1:
      return RequestPage();
      break;
    case 2:
      return AllContactsPage();
      break;
    case 3:
      return UserAccountPage();
      break;
  }
    

}