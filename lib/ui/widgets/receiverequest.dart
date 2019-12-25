import 'package:flutter/material.dart';

class ReceiveRequest extends StatefulWidget {
  @override
  _ReceiveRequestState createState() => _ReceiveRequestState();
}

class _ReceiveRequestState extends State<ReceiveRequest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20))),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      //!List view Builder
      child: ListView.builder(
        //itemExtent: 4,
        itemCount: 10,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.all(5),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset('images/user.JPG'),
            ),
            title: Text("Your name"),
            trailing: FittedBox(
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.check),
                    onPressed: (){},
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: (){},
                  )
                ],
              )
            ),
          );
        },
      ),
    );
  }
}
