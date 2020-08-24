import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String _email = "";
  String _password = "";

  void validateAndSave() {
    final form = formKey.currentState;

    try {
      if (form.validate()) {
        form.save();
        print('Email : $_email,password : $_password');
      } else {
        print('Form is invalid');
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter Login'),
      ),
      body: new Container(
          padding: EdgeInsets.all(16.0),
          child: new Form(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                  key: formKey,
                  child: new Column(
                    children: [
                      new TextFormField(
                        decoration:
                            new InputDecoration(labelText: 'Enter email'),
                        validator: (value) =>
                            value.isEmpty ? 'Email  can\t be empty' : null,
                        onSaved: (value) => _email = value,
                      ),
                      new TextFormField(
                        decoration:
                            new InputDecoration(labelText: 'Enter password'),
                        validator: (value) =>
                            value.isEmpty ? 'Password can\t be empty' : null,
                        onSaved: (value) => _password = value,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  )),
              new RaisedButton(
                child: new Text(
                  'Login here',
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.red,
                  ),
                ),
                onPressed: validateAndSave,
              )
            ],
          ))),
    );
  }
}
