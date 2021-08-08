import 'package:flutter/material.dart';
import 'package:whats_app/whatsapp_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      theme: ThemeData(
          primaryColor: Color(0xff075E54), accentColor: Color(0xff25d366)),
      home: WhatsAppHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
