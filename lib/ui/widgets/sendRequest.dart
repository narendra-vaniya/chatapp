import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SendRequests extends StatefulWidget {
  @override
  _SendRequestsState createState() => _SendRequestsState();
}

class _SendRequestsState extends State<SendRequests> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
      //!List view Builder
          child: ListView.builder(
          //itemExtent: 4,
          itemCount: 10,
          scrollDirection: Axis.vertical,
          itemBuilder: (context,index){
            return ListTile(
              contentPadding: EdgeInsets.all(5),
              leading: Image.asset('images/user.JPG'),
              title: Text("Your name"),
              trailing: FittedBox(
                child: Row(
                children: <Widget>[
                  
                  IconButton(
                    icon: Icon(Icons.check),
                    tooltip: 'Accept',
                    onPressed: (){},
                  ),
                  IconButton(
                    icon: Icon(Icons.clear),
                    tooltip: 'Cancel',

                    onPressed: (){},
                  ),
                ],
              ),
              )
            );
          },
      ),
    );
  }
}