import '../pages/signup.dart';
import '../services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  static final String id = 'Login_page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      AuthService.login(context, _email, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 250.0,
                    child: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: FlatButton(
                        onPressed: () => Navigator.pushNamed(context, SignUpPage.id),
                        color: Colors.transparent,
                        child: Text(
                          'Cadastrar-se',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
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
