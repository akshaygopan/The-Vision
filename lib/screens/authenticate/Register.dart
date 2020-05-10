import 'package:vision/Animations/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:vision/services/auth.dart';

class Register extends StatefulWidget{
 

  final Function toggleView;
  Register({ this.toggleView });
  
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Color.fromRGBO(3, 9, 23, 1),
        appBar: AppBar(
        backgroundColor: Colors.blue[800],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign in'),
            onPressed: () {
              widget.toggleView();
            }
          ),
        ],
        ),
        body: Container(
          padding: EdgeInsets.all(30),
          child: Form(
          key: _formKey,
          child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FadeAnimation(
                    1.2,
                    Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 30,
                ),
                FadeAnimation(
                    1.5,
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey[300]))),
                            child: TextFormField(
                               validator: (val) => val.isEmpty ? 'Enter an email' : null,
                               onChanged: (val) {
                                 setState(() => email = val);
                                },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color: Colors.grey.withOpacity(.8)),
                                  hintText: "Email"),
                            ),
                          ),
                          
                          Container(
                            decoration: BoxDecoration(),
                            child: TextFormField(
                              obscureText: true,
                              validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color: Colors.grey.withOpacity(.8)),
                                  hintText: "Password"),
                            ),
                          ),
                        ],
                      ),
                    )),
            SizedBox(
                  height: 5,
                ),
                RaisedButton(
                    child: Center(
                        child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white.withOpacity(.7)),
                    )),
                    color: Colors.blue[800],
                    onPressed: () async {
                  if(_formKey.currentState.validate()){
                    dynamic result = await _auth.registerWithEmailAndPassword(email.trim(), password);
                    if(result == null) {
                      setState(() {
                        error = 'Please supply a valid email';
                      });
                    }
                  }
                }
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              
                )
               ] )
           ) ),
    );
  }
}
