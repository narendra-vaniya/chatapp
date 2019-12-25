import 'package:chatapp/api/reuseWidget.dart';
import 'package:chatapp/ui/widgets/receiverequest.dart';
import 'package:chatapp/ui/widgets/sendRequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestPage extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        //!App bar
        appBar: AppBar(
          elevation: 0,
          backgroundColor: reuse.getAppbarColor(),
          leading: Container(),
          centerTitle: true,
          title: Text(
            "Requets",
            style: reuse.getAppbarTextStyle(),
          ),
          //!Tab Bar
          bottom: TabBar(
            indicatorColor: reuse.getColor(),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).canvasColor),
            tabs: <Widget>[
              Tab(
                child: Text("  Send  "),
              ),
              Tab(
                child: Text("Receive"),
              ),
            ],
          ),
        ),
        //!Body
        body: TabBarView(
          children: <Widget>[
            SendRequests(),
            ReceiveRequest(),
          ],
        ),
      ),
    );
  }
}
