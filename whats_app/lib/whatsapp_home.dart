import 'package:flutter/material.dart';
import 'package:whats_app/pages/calls.dart';
import 'package:whats_app/pages/camara.dart';
import 'package:whats_app/pages/chats.dart';
import 'package:whats_app/pages/status.dart';

class WhatsAppHome extends StatefulWidget {
  WhatsAppHome({Key key}) : super(key: key);

  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp'),
        elevation: 0.7,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(text: 'CHATS'),
            Tab(text: 'STATUS'),
            Tab(text: 'CALLS'),
          ],
        ),
        actions: <Widget>[
          Icon(Icons.search),
          Icon(Icons.more_vert),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Camara(),
          Chats(),
          Status(),
          Calls(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _tabController.index = 1;
        },
        child: Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
    );
  }
}
