import 'package:chatapp/api/reuseWidget.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(child: Text("Narendra vaniya"),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: (){

            },
          )
        ],
       
      ),
      
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(),
            ),
            SingleChildScrollView(
              child: sendMessageForm()
            )
          ],
        )
      )
    );
  }
}


//!Send Message Form

sendMessageForm(){
  final _key = GlobalKey<FormState>();
  return Form(
   child: Row(
     children: <Widget>[
       Expanded(
         flex: 4,
         child: TextFormField(
           decoration: InputDecoration(
             hintText: 'Type a mess..',
             contentPadding: EdgeInsets.all(10),
             border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(50)
             )
           )
         ),
       ),
       Expanded(
         flex: 1,
         child: IconButton(
           icon: Icon(Icons.send,color: Reuse.getColor(),),
           onPressed: (){},
         ),
       )
     ],
   ),
  );
}
