import 'package:doctor_signup/doctorList.dart';
import 'package:doctor_signup/login.dart';
import 'package:doctor_signup/signup.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Login(),
      routes: {
        'signup': (context) => SignUp(),
        'login': (context) => Login(),
        'list': (context) => DoctorListPage(),
      },
    );
  }
}
