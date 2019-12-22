import 'package:chatapp/api/reuseWidget.dart';
import 'package:chatapp/ui/widgets/sendRequest.dart';
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
          //!App bar
          appBar: AppBar(
            leading: Container(),
            centerTitle: true,
            title: Text(
              "Requets",
              style: Reuse.getAppbarTextStyle(),
            ),
            //!Tab Bar
            bottom: TabBar(
              indicator: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(50)),
              indicatorColor: Reuse.getColor(),
              indicatorWeight: 1,
              labelColor: Reuse.getColor(),
              unselectedLabelColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  child: Text("Send"),
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
              Text("data"),
            ],
          )),
    );
  }
}
