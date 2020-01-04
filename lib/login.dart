import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

import 'doctorList.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
  TextEditingController signupEmailController = new TextEditingController();
  TextEditingController signupPasswordController = new TextEditingController();
  bool _obscureTextSignup = true;

  void _toggleSignup() {
    setState(() {
      _obscureTextSignup = !_obscureTextSignup;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        child: Column(
          children: <Widget>[
            Padding(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 28),
                  textAlign: TextAlign.left,
                ),
              ),
              padding: EdgeInsets.only(left: 24),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
              child: TextField(
                controller: signupEmailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                    fontFamily: "WorkSansSemiBold",
                    fontSize: 16.0,
                    color: Colors.black),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(25)),
                  icon: Icon(Icons.alternate_email),
                  hintText: "Email Address",
                  hintStyle:
                      TextStyle(fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                ),
              ),
            ),
            Container(
              width: 250.0,
              height: 1.0,
              color: Colors.grey[400],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
              child: TextField(
                controller: signupPasswordController,
                obscureText: _obscureTextSignup,
                style: TextStyle(
                    fontFamily: "WorkSansSemiBold",
                    fontSize: 16.0,
                    color: Colors.black),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(25)),
                  icon: Icon(Icons.lock_outline),
                  hintText: "Password",
                  hintStyle:
                      TextStyle(fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                  suffixIcon: GestureDetector(
                    onTap: _toggleSignup,
                    child: Icon(
                      _obscureTextSignup
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                      size: 15.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 250.0,
              height: 1.0,
              color: Colors.grey[400],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 45,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                color: Colors.red,
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  String email = signupEmailController.text;
                  String password = signupPasswordController.text;
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: email, password: password)
                      .then((AuthResult result) {
                    if (result.user != null) {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Text('Successed'),
                                content: Text('You have login successfully'),
                                actions: <Widget>[
                                  FlatButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: Text('OK!'))
                                ],
                              ));
                      Navigator.of(context).pushReplacementNamed('list');
                    } else
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Text('Failed'),
                                content:
                                    Text('You have not login successfully'),
                                actions: <Widget>[
                                  FlatButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: Text('OK!'))
                                ],
                              ));
                    print(result.user.uid);
                  }).catchError((AuthException error) {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: Text('Failed'),
                              content: Text(error.message),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text('OK!'))
                              ],
                            ));
                  });
                },
              ),
            ),
            Padding(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Don\'t have an Account,'),
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('signup');
                    },
                    child: Text(
                      'Create a new one',
                      style: TextStyle(color: Colors.red),
                    ))
              ],
            ),padding: EdgeInsets.only(left: 8),)
          ],
        ),
        padding: EdgeInsets.only(top: 16, left: 8,right: 8),
      ),
    ));
  }
}
