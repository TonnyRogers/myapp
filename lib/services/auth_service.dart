import '../models/user_data.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../pages/feed.dart';
import '../pages/home.dart';
import '../pages/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  
  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;

  static void signUpUser(
    BuildContext context, String name, String email, String password) async{
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser signedUser = authResult.user;
      if(signedUser != null){
        _firestore.collection('users').document(signedUser.uid).setData({
          'name': name,
          'email': email,
          'profileImageUrl':''
        });
        Provider.of<UserData>(context).currentUser = signedUser.uid;
        Navigator.push(context, MaterialPageRoute(
          builder: (_) => MyApp(),
        ));
      }
    } catch (e) {
      print(e);
    }
  }

  static void logout(BuildContext context){
    _auth.signOut();
    Navigator.pushReplacementNamed(context, LoginPage.id);
  }

  static void login(BuildContext context, String email, String password) async{
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(context, MaterialPageRoute(
          builder: (_) => MyApp(),
        ));
    } catch (e) {
      print(e);
    }
  }

}