import 'package:chatapp/api/reuseWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/api/databaseApi.dart';
import 'package:provider/provider.dart';

class AllContacts extends StatefulWidget {

  @override
  _AllContactsState createState() => _AllContactsState();
}

class _AllContactsState extends State<AllContacts> {


  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Database _db =  Provider.of<Database>(context);
    DB.getAllContactList();
    return StreamBuilder(
      stream: _db.userdata,
      builder: (context,AsyncSnapshot<QuerySnapshot> userdata){
        return Text(userdata.data.documents.length.toString()??'');
      },
    );
  }
}


/*
StreamBuilder(
      stream: DB.getAllContactList(),
      builder: (context, userList) {
        return (userList.connectionState == ConnectionState.active)
            ? (userList.hasData)
                ? ListView.builder(
                    itemCount: userList.data.documents.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 0.4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1)),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(5),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              "",
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text("${userList.data.documents[0]['name']}"),
                          trailing: IconButton(
                            icon: Icon(Icons.group_add),
                            onPressed: () {},
                          ),
                        ),
                      );
                    },
                  )
                : Text("Nodata")
            : CircularProgressIndicator();
      },
    );
 */
