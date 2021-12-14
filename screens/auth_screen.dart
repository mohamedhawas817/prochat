import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class AuthScreen extends StatefulWidget {



  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
    var is_loading =  false;
    final _auth = FirebaseAuth.instance;

    final _auuthy = FirebaseAuth.instance;



  void submitAuthForm(String email, String username, String password, File image ,bool is_login, BuildContext ctx) async {
    UserCredential authResult;
    try {
      setState(() {
        is_loading = true;
      });
      if(is_login) {
         authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      }else {
        authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);

        final ref = FirebaseStorage.instance.ref().child('user_images').child(authResult.user.uid + '.jpg');

        await ref.putFile(image);

        await FirebaseFirestore.instance.collection("users").doc(authResult.user.uid).set({
          'username': username,
          'email': email,
        });


      }

    } on PlatformException catch(e) {
      print(e);
      var message = "an error occured, check your internet or you crediental";
      if(e.message !=null) {
        message = e.message;
      }
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(message) ));
      setState(() {
        is_loading = false;
      });
    } catch(err) {
      print(err);
    }

  }


  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser);
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snap) => Scaffold(
        backgroundColor: Colors.white,

        body: Center(
          child:AuthWidget(submitAuthForm, is_loading)
        ),
      ),
    );
  }
}
