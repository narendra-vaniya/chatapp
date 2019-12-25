import 'package:chatapp/api/reuseWidget.dart';
import 'package:flutter/cupertino.dart';
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
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios,color: Colors.grey,),
        ),
        backgroundColor: Colors.white,
        title: FittedBox(child: Text("Narendra vaniya",style: reuse.getAppbarTextStyle(),),),

       
      ),
      
      body: Container(
        color: Theme.of(context).canvasColor,
        padding: EdgeInsets.all(0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                ),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.all(10),
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
         child: ClipRRect(
           borderRadius: BorderRadius.circular(10),
           child: TextFormField(
                maxLines: 1,
               decoration: InputDecoration(
                 suffixIcon: IconButton(
                   icon: Icon(Icons.send),
                   onPressed: (){
                     print("sdfsdf");
                   },
                 ),

                 filled: true,
                 fillColor: Colors.white,
                 hintText: 'Type a mess..',
                 //contentPadding: EdgeInsets.all(10),
                 border:InputBorder.none,
               )
           ),
         )
       ),
      
     ],
   ),
  );
}
