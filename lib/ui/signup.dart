import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

import '../doctorList.dart';

enum SignState { patient, doctor }

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() {
    // TODO: implement createState
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  SignState signupdoc = SignState.patient;
  TextEditingController signupEmailController = new TextEditingController();
  TextEditingController signupNameController = new TextEditingController();
  TextEditingController signupPasswordController = new TextEditingController();
  TextEditingController signupConfirmPasswordController =
      new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController feeController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  bool _obscureTextSignup = true;
  bool _obscureTextSignupConfirm = true;

  void _toggleSignup() {
    setState(() {
      _obscureTextSignup = !_obscureTextSignup;
    });
  }

  void _toggleSignupConfirm() {
    setState(() {
      _obscureTextSignupConfirm = !_obscureTextSignupConfirm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        child: Column(
          children: <Widget>[
           Padding(child:  Align(
             alignment: Alignment.centerLeft,
             child: Text(
               'Sign up',
               style: TextStyle(color: Colors.blueGrey, fontSize: 28),
               textAlign: TextAlign.left,
             ),
           ),padding: EdgeInsets.only(left: 24),),
            Container(
              width: double.infinity,
              height: 506 - MediaQuery.of(context).viewInsets.bottom,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                      child: TextField(
                        controller: signupNameController,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                        style: TextStyle(
                            fontFamily: "WorkSansSemiBold",
                            fontSize: 16.0,
                            color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(25)),
                          icon: Icon(Icons.account_circle),
                          hintText: "Name",
                          hintStyle: TextStyle(
                              fontFamily: "WorkSansSemiBold", fontSize: 16.0),
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
                        controller: signupEmailController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                            fontFamily: "WorkSansSemiBold",
                            fontSize: 16.0,
                            color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(25)),
                          icon: Icon(Icons.alternate_email),
                          hintText: "Email Address",
                          hintStyle: TextStyle(
                              fontFamily: "WorkSansSemiBold", fontSize: 16.0),
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
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(25)),
                          icon: Icon(Icons.lock_outline),
                          hintText: "Password",
                          hintStyle: TextStyle(
                              fontFamily: "WorkSansSemiBold", fontSize: 16.0),
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
                    Padding(
                      padding: EdgeInsets.only(
                          top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                      child: TextField(
                        controller: signupConfirmPasswordController,
                        obscureText: _obscureTextSignupConfirm,
                        style: TextStyle(
                            fontFamily: "WorkSansSemiBold",
                            fontSize: 16.0,
                            color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(25)),
                          icon: Icon(Icons.lock_outline),
                          hintText: "Confirmation",
                          hintStyle: TextStyle(
                              fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                          suffixIcon: GestureDetector(
                            onTap: _toggleSignupConfirm,
                            child: Icon(
                              _obscureTextSignupConfirm
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
                    RadioButtonGroup(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      labels: ['Patient', 'Doctor'],
                      orientation: GroupedButtonsOrientation.VERTICAL,
                      activeColor: Colors.red,
                      onSelected: (String value) {
                        setState(() {
                          value == 'Patient'
                              ? signupdoc = SignState.patient
                              : signupdoc = SignState.doctor;
                        });
                      },
                    ),
                    signupdoc == SignState.doctor ? doctoerList() : Container(),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 45,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                color: Colors.red,
                child: Text('Sign Up',style: TextStyle(color: Colors.white),),
                onPressed: () async {
                  String email = signupEmailController.text;
                  String password = signupPasswordController.text;
                  if (signupPasswordController.text !=
                      signupConfirmPasswordController.text) {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: Text('Validation Error'),
                              content: Text(
                                  'Password filed must match the confirm field'),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text('OK!'))
                              ],
                            ));
                    return;
                  }
                  if (signupdoc == SignState.patient) {
                    if (signupNameController.text.isEmpty ||
                        signupEmailController.text.isEmpty ||
                        signupPasswordController.text.isEmpty ||
                        signupConfirmPasswordController.text.isEmpty) {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Text('Validation Error'),
                                content: Text('Complete All Fileds, please!'),
                                actions: <Widget>[
                                  FlatButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: Text('OK!'))
                                ],
                              ));
                      return;
                    }
                    FirebaseAuth mAuth = FirebaseAuth.instance;
                    FirebaseUser mUser =
                        (await mAuth.createUserWithEmailAndPassword(
                                email: email, password: password))
                            .user;
                    Firestore.instance
                        .collection('patient')
                        .document(mUser.uid)
                        .setData({
                      'name': signupNameController.text,
                      'email': signupEmailController.text,
                    });
                    return;
                  }
                  if (signupNameController.text.isEmpty ||
                      signupEmailController.text.isEmpty ||
                      signupPasswordController.text.isEmpty ||
                      signupConfirmPasswordController.text.isEmpty ||
                      phoneNumberController.text.isEmpty ||
                      feeController.text.isEmpty ||
                      addressController.text.isEmpty ||
                      cityController.text.isEmpty) {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: Text('Validation Error'),
                              content: Text('Complete All Fileds, please!'),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text('OK!'))
                              ],
                            ));
                    return;
                  }
                  print('email:${email},password:$password');
                  FirebaseAuth mAuth = FirebaseAuth.instance;
                  FirebaseUser mUser =
                      (await mAuth.createUserWithEmailAndPassword(
                              email: email, password: password))
                          .user;
                  Firestore.instance
                      .collection('doctor')
                      .document(mUser.uid)
                      .setData({
                    'name': signupNameController.text,
                    'email': signupEmailController.text,
                    'phone': phoneNumberController.text,
                    'fee': feeController.text,
                    'address': addressController.text,
                    'city': cityController.text,
                  });
                  signupNameController.clear();
                  phoneNumberController.clear();
                  feeController.clear();
                  addressController.clear();
                  cityController.clear();
                  signupEmailController.clear();
                  signupPasswordController.clear();
                  signupConfirmPasswordController.clear();
                  print("Signed UP");

                  Navigator.of(context).pushReplacementNamed('login');
                },
              ),
            ),
            Padding(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Already have an Account?'),
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('login');
                    },
                    child: Text(
                      'Login with it',
                      style: TextStyle(color: Colors.red),
                    ))
              ],
            ),padding: EdgeInsets.only(left: 8),)
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      ),
    ));
  }

  Widget doctoerList() {
    return Column(
      children: <Widget>[
        Container(
          width: 250.0,
          height: 1.0,
          color: Colors.grey[400],
        ),
        Padding(
            padding: EdgeInsets.only(
                top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
            child: TextField(
              controller: phoneNumberController,
              keyboardType: TextInputType.number,
              style: TextStyle(
                  fontFamily: "WorkSansSemiBold",
                  fontSize: 16.0,
                  color: Colors.black),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(25)),
                icon: Icon(Icons.phone),
                hintText: "Phone Number",
                hintStyle:
                    TextStyle(fontFamily: "WorkSansSemiBold", fontSize: 16.0),
              ),
            )),
        Container(
          width: 250.0,
          height: 1.0,
          color: Colors.grey[400],
        ),
        Padding(
            padding: EdgeInsets.only(
                top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
            child: TextField(
              controller: feeController,
              keyboardType: TextInputType.number,
              style: TextStyle(
                  fontFamily: "WorkSansSemiBold",
                  fontSize: 16.0,
                  color: Colors.black),
              decoration: InputDecoration(
                icon: Icon(Icons.attach_money),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(25)),
                hintText: "Enter Fee",
                hintStyle:
                    TextStyle(fontFamily: "WorkSansSemiBold", fontSize: 16.0),
              ),
            )),
        Container(
          width: 250.0,
          height: 1.0,
          color: Colors.grey[400],
        ),
        Padding(
            padding: EdgeInsets.only(
                top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
            child: TextField(
              controller: addressController,
              style: TextStyle(
                  fontFamily: "WorkSansSemiBold",
                  fontSize: 16.0,
                  color: Colors.black),
              decoration: InputDecoration(
                icon: Icon(Icons.location_on),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.grey, width: 1)),
                hintText: "Address",
                hintStyle:
                    TextStyle(fontFamily: "WorkSansSemiBold", fontSize: 16.0),
              ),
            )),
        Container(
          width: 250.0,
          height: 1.0,
          color: Colors.grey[400],
        ),
        Padding(
            padding: EdgeInsets.only(
                top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
            child: TextField(
              controller: cityController,
              style: TextStyle(
                  fontFamily: "WorkSansSemiBold",
                  fontSize: 16.0,
                  color: Colors.black),
              decoration: InputDecoration(
                icon: Icon(Icons.location_city),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(25)),
                hintText: "City",
                hintStyle:
                    TextStyle(fontFamily: "WorkSansSemiBold", fontSize: 16.0),
              ),
            )),
      ],
    );
  }
}
