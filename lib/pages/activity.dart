import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  ActivityPage({Key key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
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
      body: Center(
        child: Text('Activity'),
      ),
    );
  }
}