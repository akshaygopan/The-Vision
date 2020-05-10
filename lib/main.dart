import 'package:vision/screens/wrapper.dart';
import 'package:vision/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:vision/callservices/service_locator.dart';
import 'package:provider/provider.dart';
import 'package:vision/models/user.dart';

void main() {
  setupLocator();
  runApp(
  MyApp(
   
  ));
} 
 class MyApp  extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
         debugShowCheckedModeBanner: false
      ),
       
     );
   }
 }
