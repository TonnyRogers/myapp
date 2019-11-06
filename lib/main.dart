import './models/user_data.dart';
import 'package:provider/provider.dart';

import 'pages/feed.dart';
import 'pages/home.dart';
import 'pages/login.dart';
import 'pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Widget _getScreenId(){
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot){
        if (snapshot.hasData){
          Provider.of<UserData>(context).currentUser = snapshot.data.uid;
          return HomePage();
        }else{
          return LoginPage();
        }
      },
      );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        builder: (context) => UserData(),
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryIconTheme: Theme.of(context).primaryIconTheme.copyWith(
            color: Colors.black
          )
        ),
        home: _getScreenId(),
        routes: {
          LoginPage.id: (context) => LoginPage(),
          SignUpPage.id: (context) => SignUpPage(),
          FeedPage.id: (context) => FeedPage(),
          HomePage.id: (context) => HomePage(),
        },
      ),
    );
  }
}


