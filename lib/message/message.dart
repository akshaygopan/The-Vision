import 'package:flutter/material.dart';
import 'package:vision/callservices/calls_and_messages_service.dart';
import 'package:vision/callservices/service_locator.dart';
/*import 'package:url_launcher/url_launcher.dart' as UrlLauncher; */
import 'package:ussd/ussd.dart';
import 'dart:async';


class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
  String akshay = "+91 8289875795";
   String ashwin = "+91 9003014490";
   String avillie = "+91 7350890889";
   String hemanth = "+91 9940534531";
   String hamid = "+91 8148598005";
   String victomam = "+91 8072746179";

   Future<void> launchUssd(String ussdCode) async {
    Ussd.runUssd(ussdCode);
  }

   

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Messages'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.yellowAccent[200],
                backgroundImage: AssetImage('images/avatar.png'),
              ),
              title: Text(
                'Akshay',
              ),
              subtitle: Text('+91 8289875795'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () => launchUssd(akshay),
            ),
            Divider(
              height: 1.0,
              indent: 1.0,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green[200],
                backgroundImage: AssetImage('images/avatar_purple.png'),
              ),
              title: Text('Ashwin'),
              subtitle: Text('+91 9003014490'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: ()  => launchUssd(ashwin),
            ),
            Divider(
              height: 1.0,
              indent: 1.0,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue[200],
                backgroundImage: AssetImage('images/avatar_brown.png'),
              ),
              title: Text('Avillie'),
              subtitle: Text('+91 7350890889'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: ()  => launchUssd(avillie),
            ),
            Divider(
              height: 1.0,
              indent: 1.0,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.deepOrange[200],
                backgroundImage: AssetImage('images/avatar.png'),
              ),
              title: Text(
                'Hemanth',
              ),
              subtitle: Text('+91 9940534531'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: ()  => _service.sendSms(hemanth),
            ),
            Divider(
              height: 1.0,
              indent: 1.0,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.brown[200],
                backgroundImage: AssetImage('images/avatar_green.png'),
              ),
              title: Text('Hamid'),
              subtitle: Text('+91 8148598005'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: ()  => _service.sendSms(hamid),
            ),
            Divider(
              height: 1.0,
              indent: 1.0,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red[200],
                backgroundImage: AssetImage('images/avatar_red.png'),
              ),
              title: Text('Victo Mam'),
              subtitle: Text('+91 8072746179'),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ],
        ),
        
      );
  }
}