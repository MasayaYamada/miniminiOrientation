import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'admin_login.dart';

class AdminSignUp extends StatefulWidget {
  @override
  _AdminSignUpState createState() => _AdminSignUpState();
}

class _AdminSignUpState extends State<AdminSignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  bool _success;
  String _userEmail;

  String errorMessage = '';

  Future<FirebaseUser> handleSignUp(email, password) async {
    try {
      FirebaseUser user = (await auth.createUserWithEmailAndPassword(
          email: email, password: password)) as FirebaseUser;
      assert(user != null);
      assert(await user.getIdToken() != null);
      return user;
    } catch (e) {
      handleError(e);
      return null;
    }
  }

  handleError(PlatformException error) {
    print(error);
    switch (error.code) {
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        setState(() {
          errorMessage = 'Email Id already Exist!!!';
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('管理者登録画面'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            key: _formKey,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                alignment: Alignment.center,
                child: RaisedButton(
                  onPressed: () async {
                    handleSignUp(
                            _emailController.text, _passwordController.text)
                        .then((FirebaseUser user) {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => AdminLogin()));
                    }).catchError((e) => print(e));
                  },
                  child: const Text('Submit'),
                ),
              ),
            ]),
      ),
    );
  }
}
