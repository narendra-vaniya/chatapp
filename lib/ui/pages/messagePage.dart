import 'package:chatapp/api/auth.dart';
import 'package:chatapp/api/databaseApi.dart';
import 'package:chatapp/api/reuseWidget.dart';
import 'package:chatapp/api/screeninfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

class MessagePage extends StatefulWidget {
  int id;

  MessagePage(this.id);
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  String email;
  @override
  void initState() {
    getemail();

    super.initState();
  }

  ScrollController _contro = new ScrollController();

  void getemail() async {
    await authApi.getEmail().then((val) {
      setState(() {
        email = val;
      });
    });
    print(email);
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1), () {
      _contro.jumpTo(_contro.position.maxScrollExtent);
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Room ${this.widget.id + 1}",
          style: reuse.getAppbarTextStyle(),
        ),
      ),
      body: Container(
        color: Theme.of(context).canvasColor,
        padding: EdgeInsets.all(0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(10),
                child: StreamBuilder<QuerySnapshot>(
                    stream: DB.getAllChat(widget.id),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      Future.delayed(Duration(milliseconds: 1), () {
                        _contro.jumpTo(_contro.position.maxScrollExtent);
                      });
                      return (snapshot.hasData)
                          ? ListView.builder(
                              controller: _contro,
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, index) {
                                return Bubble(
                                  margin: BubbleEdges.only(top: 10),
                                  nip:
                                      ('${snapshot.data.documents[index]['senderemail']}' ==
                                              email)
                                          ? BubbleNip.rightTop
                                          : BubbleNip.leftTop,
                                  elevation: 1,
                                  padding: BubbleEdges.all(10),
                                  alignment:
                                      ('${snapshot.data.documents[index]['senderemail']}' ==
                                              email)
                                          ? Alignment.centerRight
                                          : Alignment.centerLeft,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                          '${snapshot.data.documents[index]['message']}'),
                                    ],
                                  ),
                                );
                              },
                            )
                          : Center(child: CircularProgressIndicator());
                    }),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: sendMessageForm(this.widget.id, email, _contro),
            )
          ],
        ),
      ),
    );
  }
}

//!Send Message Form

sendMessageForm(id, email, _contro) {
  final _key = GlobalKey<FormState>();

  var msg = TextEditingController();
  return Form(
    key: _key,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: TextFormField(
          controller: msg,
          onSaved: (val) {
            msg.text = val;
          },
          onTap: () {
            Future.delayed(Duration(milliseconds: 1), () {
              _contro.jumpTo(_contro.position.maxScrollExtent);
            });
          },
          onChanged: (data) {
            Future.delayed(Duration(milliseconds: 1), () {
              _contro.jumpTo(_contro.position.maxScrollExtent);
            });
          },
          maxLines: 1,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                if (_key.currentState.validate()) {
                  _key.currentState.save();

                  if (msg.text.isNotEmpty || msg.text != null) {
                    DB.sendMsgToRoom(
                        id, msg.text, DateTime.now().toString(), email);
                    print("Send");
                    Future.delayed(Duration(milliseconds: 1), () {
                      _contro.jumpTo(_contro.position.maxScrollExtent);
                    });
                    msg.clear();
                  } else {}
                }
              },
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Type a mess..',
            contentPadding: EdgeInsets.all(10),
            border: InputBorder.none,
          )),
    ),
  );
}
