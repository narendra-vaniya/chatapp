import 'package:chatapp/api/reuseWidget.dart';
import 'package:flutter/material.dart';

class AllContacts extends StatefulWidget {
  @override
  _AllContactsState createState() => _AllContactsState();
}

class _AllContactsState extends State<AllContacts> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          elevation: 0,
          child: ListTile(
            contentPadding: EdgeInsets.all(5),
            leading: Image.asset('images/user.JPG'),
            title: Text("Narendra vaniya"),
            trailing: IconButton(
              icon: Icon(Icons.group_add),
              onPressed: () {},
            ),
          ),
        );
      },
    );
  }
}
