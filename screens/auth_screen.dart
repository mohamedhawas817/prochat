import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/auth.dart';

class AuthScreen extends StatefulWidget {

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child:AuthWidget()
      ),
    );
  }
}
