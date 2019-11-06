import '../services/auth_service.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  static final id = 'Feed_page';

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Multi App',
          style: TextStyle(
            color: Colors.black,
            fontSize: 35.0,
            fontFamily: 'Billabong',
          ),
          ),
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: 
            FlatButton(
              color: Colors.white,
              onPressed: () => AuthService.logout(context),
              child: Text('Sair'),
            ),
        ),
    );
  }
}