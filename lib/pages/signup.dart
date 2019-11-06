import '../services/auth_service.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {

  static final String id = 'Signup_page';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final _formKey = GlobalKey<FormState>();
  String _name, _email, _password;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      AuthService.signUpUser(context, _name, _email, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        leading: IconButton(
          padding: EdgeInsets.only(left: 10.0),
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
          iconSize: 30.0,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
            Text(
              'Multi App',
              style: TextStyle(fontSize: 50.0, fontFamily: 'Billabong'),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Name'),
                      validator: (input) =>
                          input.trim().isEmpty ? 'Digite seu nome' : null,
                      onSaved: (input) => _name = input,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (input) =>
                          !input.contains('@') ? 'Digite seu e-mail' : null,
                      onSaved: (input) => _email = input,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Senha'),
                      validator: (input) =>
                          input.length < 6 ? 'Digite sua senha' : null,
                      onSaved: (input) => _password = input,
                      obscureText: true,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: 250.0,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        onPressed: _submit,
                        color: Colors.blue,
                        child: Text(
                          'Cadastrar',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
          )),
    );
  }
}